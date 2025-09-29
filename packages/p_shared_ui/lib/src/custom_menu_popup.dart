import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Kontroler umożliwiający zarządzanie zbiorem MenuControllerów utworzonych
/// w obrębie jednego logicznego menu (np. `CustomMenuPopup`). Pozwala na
/// zamknięcie wszystkich zarejestrowanych menu naraz.
class CustomMenuController {
  final Set<MenuController> _menus = <MenuController>{};

  void register(MenuController controller) => _menus.add(controller);
  void unregister(MenuController controller) => _menus.remove(controller);

  /// Zamknij wszystkie zarejestrowane menu.
  void closeAll() {
    // Skopiuj listę bo `close()` może modyfikować zbiór podczas iteracji.
    for (final controller in List<MenuController>.from(_menus)) {
      try {
        controller.close();
      } catch (_) {
        // Ignoruj błędy pojedynczych zamknięć.
      }
    }
  }
}

/// InheritedWidget, który dostarcza `CustomMenuController` do potomków.
/// Używamy go aby `_MenuState` mógł się zarejestrować i aby panel mógł
/// wywoływać `controller.closeAll()` zamiast polegać na globalnej funkcji.
class _CustomMenuControllerScope extends InheritedWidget {
  const _CustomMenuControllerScope({
    required this.controller,
    required super.child,
  });

  final CustomMenuController controller;

  static _CustomMenuControllerScope? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_CustomMenuControllerScope>();
  static CustomMenuController? of(BuildContext context) =>
      maybeOf(context)?.controller;

  @override
  bool updateShouldNotify(covariant _CustomMenuControllerScope oldWidget) =>
      controller != oldWidget.controller;
}

/// Reprezentuje pojedynczą pozycję w menu.
///
/// Pola:
/// - `title` - tekst pozycji,
/// - `icon` - ikona wyświetlana przy pozycji,
/// - `onTap` - opcjonalny callback uruchamiany po kliknięciu,
/// - `noodle` - opcjonalny widget, który będzie użyty jako podmenu (jeśli nie null).
class CustomMenuOverlay {
  const CustomMenuOverlay({
    this.iconColor,
    required this.title,
    required this.icon,
    this.onTap,
    this.noodle,
  });

  final String title;
  final Color? iconColor;
  final IconData icon;
  final VoidCallback? onTap;
  // `noodle` to opcjonalny builder panelu podmenu. Przyjmuje kontekst,
  // status animacji i callback `close` umożliwiający zamknięcie tego menu.
  final MenuPanelBuilder? noodle;
}

/// Typ dla funkcji budującej panel menu (zawartość overlay).
/// Dodatkowo przekazujemy callback `close`, który powinien zamknąć menu
/// (wywołuje `menuController.close()` w kontekście danego Menu).
typedef MenuPanelBuilder =
    Widget Function(
      BuildContext context,
      AnimationStatus animationStatus,
      VoidCallback close,
    );

/// Typ dla funkcji budującej przycisk/wyzwalacz menu. Funkcja otrzymuje
/// kontekst, kontroler menu oraz status animacji, i powinna zwrócić widget.
typedef MenuButtonBuilder =
    Widget Function(
      BuildContext context,
      MenuController controller,
      AnimationStatus animationStatus,
    );

/// Przykładowy widget pokazujący jak można zagnieździć menu i podmenu z animacją.
///
/// Używany tylko jako przykład / narzędzie pomocnicze — nie jest krytyczny dla logiki aplikacji.
// Example/demo widget removed because it was unused in the package. Keep the
// core menu implementation above.

/// Główny widget menu, który obsługuje wyświetlanie przycisku i panelu menu.
///

class CustomMenuPopup extends StatelessWidget {
  CustomMenuPopup({
    required this.menus,
    Widget? button,
    this.controller,
    this.width = 250,
    super.key,
  }) : assert(menus.isNotEmpty, 'Menus cannot be empty'),
       button =
           button ??
           IconButton(
             padding: EdgeInsets.zero,
             onPressed: null,
             icon: Icon(
               PhosphorIcons.dotsThreeVertical(),
               size: 16,
               color: Colors.black,
             ),
           );

  /// Lista pozycji menu do wyświetlenia.
  final List<CustomMenuOverlay> menus;

  /// Guzdik lub inny widget, który wyzwala menu po tapnięciu.
  /// Jeśli nie podano, używany jest domyślny IconButton z ikoną trzech kropek.
  final Widget button;

  /// Opcjonalny kontroler do zarządzania menu z zewnątrz.
  /// Jeśli nie podano, tworzony jest wewnętrzny kontroler.
  final CustomMenuController? controller;

  /// Maksymalna szerokość menu. Domyślnie 250.
  final double width;

  @override
  Widget build(BuildContext context) {
    final ctrl = controller ?? CustomMenuController();

    return _CustomMenuControllerScope(
      controller: ctrl,
      child: _Menu(
        panelBuilder: (BuildContext context, AnimationStatus animationStatus, VoidCallback close) {
          return ConstrainedBox(
            constraints: BoxConstraints(minWidth: 200, maxWidth: width),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: menus.map((menu) {
                if (menu.noodle != null) {
                  // Submenu
                  return _Menu(
                    panelBuilder:
                        (
                          BuildContext context,
                          AnimationStatus status,
                          VoidCallback close,
                        ) {
                          // Opakowujemy przekazany `close` tak, aby po zamknięciu
                          // podmenu spróbować również zamknąć menu nadrzędne.
                          final rootMenuController = MenuController.maybeOf(
                            context,
                          );
                          return menu.noodle!(context, status, () async {
                            // Zamknij najpierw to podmenu
                            close();
                            // Potem w mikrotasku spróbuj zamknąć rodzica
                            await Future.microtask(
                              () => rootMenuController?.close(),
                            );
                          });
                        },
                    buttonBuilder:
                        (
                          BuildContext context,
                          MenuController controller,
                          AnimationStatus status,
                        ) {
                          final rootMenuController = MenuController.maybeOf(
                            context,
                          );
                          return MenuItemButton(
                            style: MenuItemButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                            ),
                            leadingIcon: Icon(menu.icon, color: menu.iconColor),
                            trailingIcon: Icon(PhosphorIcons.caretRight()),
                            onFocusChange: (bool focused) {
                              if (focused) {
                                // Jeśli pozycja otrzyma fokus, zamknij inne otwarte podmenu
                                // i otwórz odpowiednie submenu.
                                rootMenuController?.closeChildren();
                                controller.open();
                              }
                            },
                            onPressed: () {
                              if (!status.isForwardOrCompleted) {
                                rootMenuController?.closeChildren();
                                controller.open();
                              } else {
                                controller.close();
                              }
                            },
                            child: Text(menu.title),
                          );
                        },
                  );
                } else {
                  // Zwykła pozycja menu - rozciągamy ją na całą szerokość,
                  // aby podświetlenie obejmowało cały wiersz.
                  return MenuItemButton(
                    style: MenuItemButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    leadingIcon: Icon(menu.icon, color: menu.iconColor),
                    onFocusChange: (bool focused) {
                      if (focused) {
                        // Zamknij ewentualne podmenu gdy fokus trafia na zwykłą pozycję
                        MenuController.maybeOf(context)?.closeChildren();
                      }
                    },
                    onPressed: () {
                      // Zamykamy najpierw menu, a dopiero potem (w mikrotasku)
                      // wywołujemy callback. Dzięki temu, jeśli callback otwiera
                      // dialog lub wykonuje nawigację, nie będzie problemów z
                      // kontekstem/usuwaniem overlay przed wykonaniem akcji.
                      final callback = menu.onTap;
                      MenuController.maybeOf(context)?.close();
                      if (callback != null) {
                        Future.microtask(callback);
                      }
                    },
                    child: Text(menu.title),
                  );
                }
              }).toList(),
            ),
          );
        },
        buttonBuilder:
            (
              BuildContext context,
              MenuController controller,
              AnimationStatus animationStatus,
            ) {
              return GestureDetector(
                onTap: () {
                  // Przełącz menu po tapnięciu w przycisk/wyzwalacz.
                  if (animationStatus.isForwardOrCompleted) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                child: button,
              );
            },
      ),
    );
  }
}

class _Menu extends StatefulWidget {
  const _Menu({required this.panelBuilder, required this.buttonBuilder});
  final MenuPanelBuilder panelBuilder;
  final MenuButtonBuilder buttonBuilder;

  @override
  State<_Menu> createState() => _MenuState();
}

class _MenuState extends State<_Menu> with SingleTickerProviderStateMixin {
  final MenuController menuController = MenuController();
  CustomMenuController? _hostController;
  late final AnimationController animationController;
  late final CurvedAnimation animation;
  bool get isSubmenu => MenuController.maybeOf(context) != null;
  AnimationStatus get animationStatus => animationController.status;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animationController.addStatusListener((AnimationStatus status) {
      if (mounted) {
        setState(() {
          // Przebuduj widget aby odzwierciedlić zmianę statusu animacji.
        });
      }
    });

    // Spróbuj zarejestrować się w CustomMenuController, jeśli istnieje on
    // wyżej w drzewie. Rejestrację wykonujemy w didChangeDependencies,
    // ponieważ nie można bezpiecznie użyć `context` w initState.

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutQuart,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final scope = _CustomMenuControllerScope.maybeOf(context);
    if (scope != null) {
      // Jeśli scope (zakres) uległ zmianie, wyrejestruj się z poprzedniego
      // kontrolera i zarejestruj w nowym.
      if (_hostController != scope.controller) {
        _hostController?.unregister(menuController);
        _hostController = scope.controller;
        _hostController?.register(menuController);
      }
    }
  }

  @override
  void dispose() {
    // Wyrejestruj się z hosta, jeśli wcześniej się zarejestrowano.
    _hostController?.unregister(menuController);
    animationController.dispose();
    super.dispose();
  }

  void _handleMenuOpenRequest(Offset? position, VoidCallback showOverlay) {
    // Zamontuj lub ustaw pozycję menu przed rozpoczęciem animacji otwierania.
    showOverlay();

    if (animationStatus.isForwardOrCompleted) {
      // Jeśli menu jest już otwarte lub w trakcie otwierania, nic nie rób.
      // Animacja już idzie w kierunku otwarcia.
      return;
    }

    // Uruchom animację otwierania menu.
    unawaited(animationController.forward());
  }

  void _handleMenuCloseRequest(VoidCallback hideOverlay) {
    if (!animationStatus.isForwardOrCompleted) {
      // Jeśli menu jest już zamknięte lub w trakcie zamykania, nic nie rób.
      return;
    }
    // Animuj zamykanie dzieci menu (jeśli są otwarte).
    menuController.closeChildren();

    // Animuj zamykanie samego menu.
    unawaited(animationController.reverse().whenComplete(hideOverlay));
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      role: SemanticsRole.menu,
      child: RawMenuAnchor(
        controller: menuController,
        onOpenRequested: _handleMenuOpenRequest,
        onCloseRequested: _handleMenuCloseRequest,
        overlayBuilder: (BuildContext context, RawMenuOverlayInfo info) {
          final position = isSubmenu
              ? info.anchorRect.topRight
              : info.anchorRect.bottomLeft;
          final colorScheme = ColorScheme.of(context);
          return Positioned(
            top: position.dy,
            left: position.dx,
            child: Semantics(
              explicitChildNodes: true,
              scopesRoute: true,
              // Usuń focus, gdy menu się zamyka.
              child: ExcludeFocus(
                excluding: !animationStatus.isForwardOrCompleted,
                child: TapRegion(
                  groupId: info.tapRegionGroupId,
                  onTapOutside: (PointerDownEvent event) {
                    menuController.close();
                  },
                  child: FadeTransition(
                    opacity: animation,
                    child: Material(
                      elevation: 8,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(4),
                      shadowColor: colorScheme.shadow,
                      child: SizeTransition(
                        axisAlignment: position.dx < 0 ? 1 : -1,
                        sizeFactor: animation,
                        fixedCrossAxisSizeFactor: 1,
                        child: widget.panelBuilder(context, animationStatus, () {
                          // Preferujemy użycie jawnego scope'a `CustomMenuController`
                          // aby zamknąć wszystkie menu w ramach jednego logicznego drzewa.
                          final controller = _CustomMenuControllerScope.of(
                            context,
                          );
                          if (controller != null) {
                            controller.closeAll();
                            return;
                          }

                          // Fallback (zapasowy): przejdź po ancestorach i zamknij
                          // znalezione kontrolery menu. Powinno się rzadko zdarzać
                          // jeśli używamy scope'a.
                          MenuController.maybeOf(context)?.close();
                          context.visitAncestorElements((element) {
                            MenuController.maybeOf(element)?.close();
                            return true;
                          });
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
              return widget.buttonBuilder(context, controller, animationStatus);
            },
      ),
    );
  }
}
