import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:p_shared_ui/src/gradient_box_border.dart';
import 'package:p_utils/p_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// System powiadomień toast dla aplikacji web.
///
/// WebToast umożliwia wyświetlanie powiadomień w różnych pozycjach ekranu:
/// - Pozycje górne (top): obsługują multiple toasty (stos)
/// - Pozycje dolne (bottom): obsługują single toast (jeden na raz)
///
/// Przykład użycia:
/// ```dart
/// // Toast w pozycji górnej (może być wiele jednocześnie)
/// WebToast.showTop(
///   position: WebToastTopPosition.topRight,
///   toast: ToastData(
///     message: "Operacja zakończona pomyślnie!",
///     type: WebToastType.success,
///   ),
///   context: context,
/// );
///
/// // Toast w pozycji dolnej (tylko jeden na raz)
/// WebToast.showBottom(
///   position: WebToastBottomPosition.bottomCenter,
///   toast: ToastData(
///     message: "Wystąpił błąd!",
///     type: WebToastType.error,
///   ),
///   context: context,
/// );
/// ```
enum WebToastType {
  /// Toast sukcesu - zielony kolor
  success,

  /// Toast błędu - czerwony kolor
  error,

  /// Toast ostrzeżenia - pomarańczowy kolor
  warning,

  /// Toast informacyjny - niebieski kolor
  info,
}

/// Pozycje górne dla toast'ów - obsługują multiple toasty (stos).
///
/// Te pozycje pozwalają na wyświetlanie wielu toast'ów jednocześnie,
/// które układają się jeden na drugim w formie stosu.
enum WebToastTopPosition {
  /// Prawy górny róg ekranu
  topRight,

  /// Lewy górny róg ekranu
  topLeft,

  /// Górna część ekranu na środku
  topCenter,
}

/// Pozycje dolne dla toast'ów - obsługują single toast (jeden na raz).
///
/// Te pozycje wyświetlają tylko jeden toast na raz.
/// Nowy toast zastępuje poprzedni z animacją przejścia.
enum WebToastBottomPosition {
  /// Prawy dolny róg ekranu
  bottomRight,

  /// Lewy dolny róg ekranu
  bottomLeft,

  /// Dolna część ekranu na środku
  bottomCenter,
}

/// Główna klasa systemu WebToast.
///
/// Zarządza wyświetlaniem powiadomień toast w różnych pozycjach ekranu.
/// Używa dwóch oddzielnych systemów:
/// - Pozycje górne: multiple toasty (stos)
/// - Pozycje dolne: single toast (jeden na raz)
class WebToast {
  /// Mapa overlay entries dla pozycji górnych - multiple toasty
  static final Map<WebToastTopPosition, OverlayEntry> _topOverlayEntries = {};

  /// Mapa list toast'ów dla pozycji górnych - multiple toasty
  static final Map<WebToastTopPosition, ValueNotifier<List<ToastData>>>
  _topToastsByPosition = {};

  /// Mapa overlay entries dla pozycji dolnych - single toast
  static final Map<WebToastBottomPosition, OverlayEntry> _bottomOverlayEntries =
      {};

  /// Mapa pojedynczych toast'ów dla pozycji dolnych - single toast
  static final Map<WebToastBottomPosition, ValueNotifier<ToastData?>>
  _bottomToastsByPosition = {};

  /// Lista przyszłych operacji usuwania toast'ów z timerami
  static final Map<String, Timer> _removalTimers = {};

  /// Wyświetla toast w pozycji górnej - obsługuje multiple toasty (stos).
  ///
  /// Ta metoda pozwala na wyświetlanie wielu toast'ów jednocześnie w wybranej pozycji górnej.
  /// Toasty układają się jeden na drugim w formie stosu.
  ///
  /// [toast] - dane toast'a do wyświetlenia
  /// [context] - kontekst budowy widget'a
  /// [duration] - czas wyświetlania toast'a (domyślnie 3 sekundy)
  /// [animateDuration] - czas trwania animacji (domyślnie 300ms)
  /// [position] - pozycja górna gdzie ma być wyświetlony toast
  static void showTop({
    required ToastData toast,
    required BuildContext context,
    Duration? duration,
    Duration? animateDuration,
    WebToastTopPosition position = WebToastTopPosition.topRight,
  }) {
    // Inicjalizuj listę toastów dla tej pozycji jeśli nie istnieje
    _topToastsByPosition[position] ??= ValueNotifier(<ToastData>[]);

    if (toast.automaticallyDismiss) {
      final timer = Timer(duration ?? const Duration(seconds: 3), () {
        final toasts = _topToastsByPosition[position];
        if (toasts != null) {
          toasts.value = toasts.value.where((t) => t.id != toast.id).toList();
          if (toasts.value.isEmpty) {
            Timer(
              Duration(milliseconds: animateDuration?.inMilliseconds ?? 300),
              () {
                // Sprawdź czy overlay nadal istnieje przed usunięciem
                final overlayEntry = _topOverlayEntries[position];
                if (overlayEntry != null) {
                  try {
                    overlayEntry.remove();
                  } catch (e) {
                    // Overlay może już być usunięty
                  }
                  _topOverlayEntries.remove(position);
                  _topToastsByPosition.remove(position);
                }
              },
            );
          } else {
            _topOverlayEntries[position]?.markNeedsBuild();
          }
        }
        _removalTimers.remove(toast.id);
      });
      _removalTimers[toast.id] = timer;
    }

    if (_topOverlayEntries[position] == null) {
      _topOverlayEntries[position] = OverlayEntry(
        builder: (context) => _buildTopPositionedWidget(position),
      );
      Overlay.of(context).insert(_topOverlayEntries[position]!);

      // Dodaj pierwszy toast po stworzeniu overlay - to wywołuje animację
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _topToastsByPosition[position]!.value = [toast];
      });
    } else {
      // Dodaj kolejny toast do istniejącej listy dla tej pozycji
      final toasts = _topToastsByPosition[position]!;
      toasts.value = [...toasts.value, toast];
      _topOverlayEntries[position]?.markNeedsBuild();
    }
  }

  /// Wyświetla toast w pozycji dolnej - obsługuje single toast (jeden na raz).
  ///
  /// Ta metoda wyświetla tylko jeden toast na raz w wybranej pozycji dolnej.
  /// Nowy toast zastępuje poprzedni z animacją przejścia.
  ///
  /// [toast] - dane toast'a do wyświetlenia
  /// [context] - kontekst budowy widget'a
  /// [duration] - czas wyświetlania toast'a (domyślnie 3 sekundy)
  /// [animateDuration] - czas trwania animacji (domyślnie 300ms)
  /// [position] - pozycja dolna gdzie ma być wyświetlony toast
  static void showBottom({
    required ToastData toast,
    required BuildContext context,
    Duration? duration,
    Duration? animateDuration,
    WebToastBottomPosition position = WebToastBottomPosition.bottomRight,
  }) {
    // Inicjalizuj toast dla tej pozycji jeśli nie istnieje
    _bottomToastsByPosition[position] ??= ValueNotifier<ToastData?>(null);

    if (toast.automaticallyDismiss) {
      final timer = Timer(duration ?? const Duration(seconds: 3), () {
        final currentToast = _bottomToastsByPosition[position];
        if (currentToast != null && currentToast.value?.id == toast.id) {
          currentToast.value = null;
          Timer(
            Duration(milliseconds: animateDuration?.inMilliseconds ?? 300),
            () {
              // Sprawdź czy overlay nadal istnieje przed usunięciem
              final overlayEntry = _bottomOverlayEntries[position];
              if (overlayEntry != null) {
                try {
                  overlayEntry.remove();
                } catch (e) {
                  // Overlay może już być usunięty
                }
                _bottomOverlayEntries.remove(position);
                _bottomToastsByPosition.remove(position);
              }
            },
          );
        }
        _removalTimers.remove(toast.id);
      });
      _removalTimers[toast.id] = timer;
    }

    if (_bottomOverlayEntries[position] == null) {
      _bottomOverlayEntries[position] = OverlayEntry(
        builder: (context) => _buildBottomPositionedWidget(position),
      );
      Overlay.of(context).insert(_bottomOverlayEntries[position]!);

      // Ustaw toast po stworzeniu overlay
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _bottomToastsByPosition[position]!.value = toast;
      });
    } else {
      // Zastąp istniejący toast nowym
      _bottomToastsByPosition[position]!.value = toast;
      _bottomOverlayEntries[position]?.markNeedsBuild();
    }
  }

  /// Buduje widget pozycjonowany dla pozycji górnych.
  ///
  /// [position] - pozycja górna dla której ma być zbudowany widget
  /// Zwraca widget Positioned z odpowiednimi parametrami pozycjonowania
  static Widget _buildTopPositionedWidget(WebToastTopPosition position) {
    return _buildPositionedWidget(
      position: position,
      isTop: true,
      child: TopToastsWidget(position: position),
    );
  }

  /// Buduje widget pozycjonowany dla pozycji dolnych.
  ///
  /// [position] - pozycja dolna dla której ma być zbudowany widget
  /// Zwraca widget Positioned z odpowiednimi parametrami pozycjonowania
  static Widget _buildBottomPositionedWidget(WebToastBottomPosition position) {
    return _buildPositionedWidget(
      position: position,
      isTop: false,
      child: BottomToastWidget(position: position),
    );
  }

  /// Wspólna metoda budująca widget pozycjonowany.
  ///
  /// [position] - pozycja (górna lub dolna)
  /// [isTop] - czy to pozycja górna (true) czy dolna (false)
  /// [child] - widget do pozycjonowania
  static Widget _buildPositionedWidget({
    required dynamic position,
    required bool isTop,
    required Widget child,
  }) {
    final isRight = position.toString().contains('Right');
    final isCenter = position.toString().contains('Center');

    if (isCenter) {
      return Positioned(
        top: isTop ? 20 : null,
        bottom: isTop ? null : 20,
        left: 0,
        right: 0,
        child: Center(child: child),
      );
    } else if (isRight) {
      return Positioned(
        top: isTop ? 20 : null,
        bottom: isTop ? null : 20,
        right: 20,
        child: child,
      );
    } else {
      // isLeft
      return Positioned(
        top: isTop ? 20 : null,
        bottom: isTop ? null : 20,
        left: 20,
        child: child,
      );
    }
  }

  /// Wspólna metoda określająca kierunek animacji dla pozycji.
  ///
  /// [position] - pozycja (górna lub dolna)
  /// [isTop] - czy to pozycja górna (true) czy dolna (false)
  /// Zwraca Offset określający kierunek animacji wejścia
  static Offset _getSlideOffsetForPosition(
    dynamic position, {
    required bool isTop,
  }) {
    final isRight = position.toString().contains('Right');
    final isCenter = position.toString().contains('Center');

    if (isCenter) {
      return Offset(0, isTop ? -1 : 1); // Z góry lub z dołu
    } else if (isRight) {
      return const Offset(1, 0); // Z prawej strony
    } else {
      // isLeft
      return const Offset(-1, 0); // Z lewej strony
    }
  }

  /// Wspólna metoda budująca widget toast'a.
  ///
  /// [toast] - dane toast'a
  /// [onClose] - funkcja wywoływana przy zamknięciu
  /// [key] - opcjonalny klucz dla widget'a
  /// Zwraca widget reprezentujący toast
  static Widget buildToastWidget({
    required ToastData toast,
    required VoidCallback onClose,
    Key? key,
  }) {
    return Material(
      key: key,
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(Sizes.p4),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          border: GradientBoxBorder(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.transparent, Colors.white],
            ),
          ),
          borderRadius: BorderRadius.circular(Sizes.p4),
          color: Colors.transparent,
        ),
        width: 250,
        height: 130,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Sizes.p4),
                  bottomLeft: Radius.circular(Sizes.p4),
                ),
                color: _getToastColor(toast.type),
              ),
              child: Icon(_getToastIcon(toast.type), color: Colors.white),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Sizes.p4),
                  bottomRight: Radius.circular(Sizes.p4),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.p8,
                      vertical: Sizes.p4,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            toast.message,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.p12,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            PhosphorIcons.xCircle(),
                            color: Colors.white,
                            size: Sizes.p12,
                          ),
                          onPressed: onClose,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Zwraca kolor dla typu toast'a.
  static Color _getToastColor(WebToastType type) {
    return switch (type) {
      WebToastType.success => Colors.green,
      WebToastType.error => Colors.red,
      WebToastType.warning => Colors.orange,
      WebToastType.info => Colors.blue,
    };
  }

  /// Zwraca ikonę dla typu toast'a.
  static IconData _getToastIcon(WebToastType type) {
    return switch (type) {
      WebToastType.success => PhosphorIcons.checkCircle(),
      WebToastType.error => PhosphorIcons.xCircle(),
      WebToastType.warning => PhosphorIcons.warningDiamond(),
      WebToastType.info => PhosphorIcons.info(),
    };
  }
}

/// Klasa reprezentująca dane toast'a.
///
/// Zawiera wszystkie informacje potrzebne do wyświetlenia powiadomienia toast.
class ToastData {
  /// Unikalny identyfikator toast'a
  final String id = UniqueKey().toString();

  /// Tekst wiadomości do wyświetlenia
  final String message;

  /// Typ toast'a określający kolor i ikonę
  final WebToastType type;

  /// Opcjonalna funkcja wywoływana po kliknięciu w toast
  final VoidCallbackAction? onTap;

  /// Czy toast ma być automatycznie usunięty po określonym czasie
  final bool automaticallyDismiss;

  /// Tworzy nowy obiekt ToastData.
  ///
  /// [message] - tekst wiadomości (wymagany)
  /// [type] - typ toast'a (domyślnie info)
  /// [onTap] - funkcja wywoływana po kliknięciu (opcjonalna)
  /// [automaticallyDismiss] - czy automatycznie usuwać (domyślnie true)
  ToastData({
    required this.message,
    this.type = WebToastType.info,
    this.onTap,
    this.automaticallyDismiss = true,
  });
}

/// Widget wyświetlający multiple toasty w pozycji górnej.
///
/// Używa AnimatedList do wyświetlania wielu toast'ów jednocześnie
/// w formie stosu z animacjami dodawania i usuwania.
class TopToastsWidget extends StatefulWidget {
  /// Tworzy widget dla pozycji górnych.
  ///
  /// [position] - pozycja górna gdzie mają być wyświetlane toasty
  const TopToastsWidget({super.key, required this.position});

  /// Pozycja górna dla tego widget'a
  final WebToastTopPosition position;

  @override
  State<TopToastsWidget> createState() => _TopToastsWidgetState();
}

class _TopToastsWidgetState extends State<TopToastsWidget>
    with TickerProviderStateMixin {
  List<ToastData> _currentToasts = [];
  bool _isDisposed = false;
  final Map<String, AnimationController> _itemControllers = {};
  final Map<String, Animation<Offset>> _slideAnimations = {};
  final Map<String, Animation<double>> _fadeAnimations = {};
  final Map<String, Animation<double>> _sizeAnimations = {};
  final Set<String> _removingToasts = {};

  @override
  void initState() {
    super.initState();
    final toasts = WebToast._topToastsByPosition[widget.position];
    if (toasts != null) {
      toasts.addListener(_onToastsChanged);
      _currentToasts = List.from(toasts.value);
      // Utwórz animacje dla istniejących toast'ów
      for (final toast in _currentToasts) {
        _createAnimationForToast(toast);
      }
    }
  }

  @override
  void dispose() {
    if (!_isDisposed) {
      _isDisposed = true;

      // Anuluj wszystkie timery dla toast'ów z tej pozycji
      for (final toast in _currentToasts) {
        final timer = WebToast._removalTimers[toast.id];
        if (timer != null) {
          timer.cancel();
          WebToast._removalTimers.remove(toast.id);
        }
      }

      // Dispose wszystkich AnimationController
      for (final controller in _itemControllers.values) {
        if (mounted) {
          controller.dispose();
        }
      }
      _itemControllers.clear();
      _slideAnimations.clear();
      _fadeAnimations.clear();
      _sizeAnimations.clear();
      _removingToasts.clear();

      final toasts = WebToast._topToastsByPosition[widget.position];
      if (toasts != null) {
        toasts.removeListener(_onToastsChanged);
      }
    }
    super.dispose();
  }

  void _onToastsChanged() {
    if (_isDisposed || !mounted) return;

    final toasts = WebToast._topToastsByPosition[widget.position];
    if (toasts == null) return;

    final newToasts = toasts.value;

    // Znajdź dodane toasty
    for (final toast in newToasts) {
      if (!_currentToasts.any((t) => t.id == toast.id)) {
        if (!_isDisposed && mounted) {
          _createAnimationForToast(toast);
          _currentToasts.add(toast);
          setState(() {});
        }
      }
    }

    // Znajdź usunięte toasty
    for (var i = _currentToasts.length - 1; i >= 0; i--) {
      final toast = _currentToasts[i];
      if (!newToasts.any((t) => t.id == toast.id)) {
        if (!_isDisposed && mounted) {
          _removeToastWithAnimation(toast);
        }
      }
    }
  }

  void _createAnimationForToast(ToastData toast) {
    if (_itemControllers.containsKey(toast.id)) return;

    final controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    final slideAnimation = Tween<Offset>(
      begin: _getSlideBeginOffset(),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    final fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    final sizeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    _itemControllers[toast.id] = controller;
    _slideAnimations[toast.id] = slideAnimation;
    _fadeAnimations[toast.id] = fadeAnimation;
    _sizeAnimations[toast.id] = sizeAnimation;

    // Uruchom animację wejścia
    controller.forward();
  }

  void _removeToastWithAnimation(ToastData toast) {
    final controller = _itemControllers[toast.id];
    if (controller != null && mounted) {
      _removingToasts.add(toast.id);
      controller.reverse().then((_) {
        if (mounted && !_isDisposed) {
          _currentToasts.removeWhere((t) => t.id == toast.id);
          _removingToasts.remove(toast.id);
          _disposeToastAnimation(toast.id);
          setState(() {});
        }
      });
      // Trigger rebuild to show animation
      setState(() {});
    }
  }

  void _disposeToastAnimation(String toastId) {
    final controller = _itemControllers[toastId];
    if (controller != null && mounted) {
      controller.dispose();
    }
    _itemControllers.remove(toastId);
    _slideAnimations.remove(toastId);
    _fadeAnimations.remove(toastId);
    _sizeAnimations.remove(toastId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 300,
        maxHeight: MediaQuery.sizeOf(context).height,
      ),
      color: Colors.transparent,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Column(
          key: ValueKey(_currentToasts.map((t) => t.id).join(',')),
          mainAxisSize: MainAxisSize.min,
          children: _currentToasts
              .map((toast) => _buildAnimatedToastItem(toast))
              .toList(),
        ),
      ),
    );
  }

  /// Określa kierunek animacji wejścia dla pozycji górnych.
  ///
  /// Zwraca Offset określający z której strony toast ma wchodzić:
  /// - topRight: z prawej strony (1, 0)
  /// - topLeft: z lewej strony (-1, 0)
  /// - topCenter: z góry (0, -1)
  Offset _getSlideBeginOffset() {
    return WebToast._getSlideOffsetForPosition(widget.position, isTop: true);
  }

  Widget _buildAnimatedToastItem(ToastData toast) {
    final slideAnimation = _slideAnimations[toast.id];
    final fadeAnimation = _fadeAnimations[toast.id];
    final sizeAnimation = _sizeAnimations[toast.id];

    final child = WebToast.buildToastWidget(
      key: ValueKey(toast.id),
      toast: toast,
      onClose: () => _closeToast(toast),
    );

    if (slideAnimation != null &&
        fadeAnimation != null &&
        sizeAnimation != null) {
      return AnimatedBuilder(
        animation: slideAnimation,
        builder: (context, _) {
          return SizeTransition(
            sizeFactor: sizeAnimation,
            axisAlignment: -1.0, // Animuj od góry
            child: SlideTransition(
              position: slideAnimation,
              child: FadeTransition(opacity: fadeAnimation, child: child),
            ),
          );
        },
      );
    }

    return child;
  }

  /// Zamyka toast i zarządza overlay'em.
  void _closeToast(ToastData toast) {
    if (_isDisposed) return;

    // Anuluj timer automatycznego usuwania
    final timer = WebToast._removalTimers[toast.id];
    if (timer != null) {
      timer.cancel();
      WebToast._removalTimers.remove(toast.id);
    }

    final toasts = WebToast._topToastsByPosition[widget.position];
    if (toasts != null) {
      toasts.value = toasts.value.where((t) => t.id != toast.id).toList();
      if (toasts.value.isEmpty) {
        // Opóźnienie, żeby animacja wyjścia mogła się zakończyć
        Timer(const Duration(milliseconds: 300), () {
          if (!_isDisposed) {
            // Sprawdź czy overlay nadal istnieje przed usunięciem
            final overlayEntry = WebToast._topOverlayEntries[widget.position];
            if (overlayEntry != null) {
              try {
                overlayEntry.remove();
              } catch (e) {
                // Overlay może już być usunięty
              }
              WebToast._topOverlayEntries.remove(widget.position);
              WebToast._topToastsByPosition.remove(widget.position);
            }
          }
        });
      } else {
        // Force rebuild to update the UI
        if (!_isDisposed) {
          WebToast._topOverlayEntries[widget.position]?.markNeedsBuild();
        }
      }
    }
  }
}

/// Widget wyświetlający single toast w pozycji dolnej.
///
/// Używa AnimationController do kontrolowania animacji wejścia i wyjścia.
/// Wyświetla tylko jeden toast na raz - nowy zastępuje poprzedni.
class BottomToastWidget extends StatefulWidget {
  /// Tworzy widget dla pozycji dolnych.
  ///
  /// [position] - pozycja dolna gdzie ma być wyświetlany toast
  const BottomToastWidget({super.key, required this.position});

  /// Pozycja dolna dla tego widget'a
  final WebToastBottomPosition position;

  @override
  State<BottomToastWidget> createState() => _BottomToastWidgetState();
}

class _BottomToastWidgetState extends State<BottomToastWidget>
    with TickerProviderStateMixin {
  ToastData? _currentToast;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(begin: _getSlideBeginOffset(), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    final toast = WebToast._bottomToastsByPosition[widget.position];
    if (toast != null) {
      toast.addListener(_onToastChanged);
      _currentToast = toast.value;
      if (_currentToast != null) {
        _animationController.forward();
      }
    }
  }

  @override
  void dispose() {
    if (!_isDisposed) {
      _isDisposed = true;

      // Anuluj timer automatycznego usuwania dla bieżącego toast'a
      if (_currentToast != null) {
        final timer = WebToast._removalTimers[_currentToast!.id];
        if (timer != null) {
          timer.cancel();
          WebToast._removalTimers.remove(_currentToast!.id);
        }
      }

      _animationController.dispose();

      final toast = WebToast._bottomToastsByPosition[widget.position];
      if (toast != null) {
        toast.removeListener(_onToastChanged);
      }
    }
    super.dispose();
  }

  void _onToastChanged() {
    if (_isDisposed) return;

    final toast = WebToast._bottomToastsByPosition[widget.position];
    if (toast != null) {
      if (toast.value != null && _currentToast == null) {
        // Nowy toast - ustaw i uruchom animację wejścia
        if (mounted) {
          setState(() {
            _currentToast = toast.value;
          });
          _animationController.reset();
          _animationController.forward();
        }
      } else if (toast.value == null && _currentToast != null) {
        // Toast został usunięty - uruchom animację wyjścia
        if (mounted && !_isDisposed) {
          _animationController.reverse().then((_) {
            if (mounted && !_isDisposed) {
              setState(() {
                _currentToast = null;
              });
            }
          });
        }
      } else if (toast.value != null &&
          _currentToast != null &&
          toast.value!.id != _currentToast!.id) {
        // Nowy toast zastępuje stary - animacja przejścia
        if (mounted) {
          setState(() {
            _currentToast = toast.value;
          });
          _animationController.reset();
          _animationController.forward();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentToast == null) {
      return const SizedBox.shrink();
    }

    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: _buildToastItem(_currentToast!),
      ),
    );
  }

  /// Określa kierunek animacji wejścia dla pozycji dolnych.
  ///
  /// Zwraca Offset określający z której strony toast ma wchodzić:
  /// - bottomRight: z prawej strony (1, 0)
  /// - bottomLeft: z lewej strony (-1, 0)
  /// - bottomCenter: z dołu (0, 1)
  Offset _getSlideBeginOffset() {
    return WebToast._getSlideOffsetForPosition(widget.position, isTop: false);
  }

  Widget _buildToastItem(ToastData toast) {
    return WebToast.buildToastWidget(
      key: ValueKey(toast.id),
      toast: toast,
      onClose: () => _closeToast(),
    );
  }

  /// Zamyka toast z animacją i zarządza overlay'em.
  void _closeToast() {
    if (_isDisposed) return;

    final currentToast = WebToast._bottomToastsByPosition[widget.position];
    if (currentToast != null && !_isDisposed && _currentToast != null) {
      // Anuluj timer automatycznego usuwania
      final timer = WebToast._removalTimers[_currentToast!.id];
      if (timer != null) {
        timer.cancel();
        WebToast._removalTimers.remove(_currentToast!.id);
      }

      // Uruchom animację wyjścia
      _animationController.reverse().then((_) {
        // Po zakończeniu animacji, usuń toast i overlay
        if (!_isDisposed) {
          currentToast.value = null;
          Timer(const Duration(milliseconds: 50), () {
            // Sprawdź czy overlay nadal istnieje przed usunięciem
            final overlayEntry =
                WebToast._bottomOverlayEntries[widget.position];
            if (overlayEntry != null) {
              try {
                overlayEntry.remove();
              } catch (e) {
                // Overlay może już być usunięty
              }
              WebToast._bottomOverlayEntries.remove(widget.position);
              WebToast._bottomToastsByPosition.remove(widget.position);
            }
          });
        }
      });
    }
  }
}
