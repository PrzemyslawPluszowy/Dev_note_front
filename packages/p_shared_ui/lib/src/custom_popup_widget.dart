import 'dart:async';

import 'package:flutter/material.dart';
import 'package:p_utils/p_utils.dart';

enum Type { icon, text }

class CustomPopupWidget extends StatefulWidget {
  const CustomPopupWidget({
    required this.content,
    required this.icon,
    super.key,
    this.width = 200,
    this.height,
    this.iconColor,
    this.iconSize,
    this.type = Type.icon,
    this.textButton,
  }) : assert(
         type == Type.icon || (type == Type.text && textButton != null),
         'If type is text, textButton must be provided',
       );
  final String? textButton;

  /// content builder with closePopup callback
  /// to close the popup from inside the content
  final Widget Function(VoidCallback closePopup) content;

  /// icon for the button that triggers the popup
  /// you can use any IconData here
  final IconData icon;

  /// type of the button (icon or text)
  final Type type;

  /// optional icon color
  final Color? iconColor;

  /// optional icon size
  final double? iconSize;

  /// optional width for the popup
  final double width;

  /// optional height for the popup
  final double? height;

  @override
  State<CustomPopupWidget> createState() => _CustomPopupWidgetState();
}

class _CustomPopupWidgetState extends State<CustomPopupWidget> {
  final GlobalKey _buttonKey = GlobalKey();

  /// Show the custom popup near the button
  void _showCustomPopup(BuildContext context, GlobalKey buttonKey) {
    final renderBox =
        buttonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      unawaited(
        showDialog<void>(
          context: context,
          builder: (context) => Dialog(
            child: Container(
              width: widget.width,
              height: widget.height,
              padding: const EdgeInsets.all(Sizes.p16),
              child: widget.content(() => Navigator.of(context).pop()),
            ),
          ),
        ),
      );
      return;
    }

    final position = renderBox.localToGlobal(Offset.zero);
    final buttonSize = renderBox.size;

    final screenSize = MediaQuery.of(context).size;
    final padding = 8.0;

    // Przybliżone wymiary popupu jeśli height == null - zapasowy rozmiar
    final popupWidth = widget.width;
    final popupHeight = widget.height ?? 500.0;

    // Domyślnie pokazujemy poniżej przycisku
    double left = position.dx;
    double top = position.dy + buttonSize.height + padding;

    // Jeśli nie mieści się poniżej - spróbuj wyświetlić nad przyciskiem
    if (top + popupHeight > screenSize.height - padding) {
      final topAbove = position.dy - popupHeight - padding;
      if (topAbove >= padding) {
        top = topAbove - widget.iconSize!;
      } else {
        // Jeśli nie ma miejsca ani ponad ani pod - spróbuj z prawej strony
        final leftRight = position.dx + buttonSize.width + padding;
        if (leftRight + popupWidth <= screenSize.width - padding) {
          left = leftRight;
          // wertykalnie staraj się wyrównać z przyciskiem w dopuszczalnym zakresie
          top = (position.dy).clamp(
            padding,
            screenSize.height - popupHeight - padding,
          );
        } else {
          // Ostatecznie dopasuj w poziomie do ekranu (np. wyrównanie do prawej krawędzi przycisku)
          left = (position.dx + buttonSize.width - popupWidth).clamp(
            padding,
            screenSize.width - popupWidth - padding,
          );
          // i w pionie przybliż do dostępnej przestrzeni
          top = (position.dy + buttonSize.height + padding).clamp(
            padding,
            screenSize.height - popupHeight - padding,
          );
        }
      }
    } else {
      // Jeśli poniżej ale wychodzi poza prawą krawędź ekranu -> przesuń w lewo tak, by był widoczny
      if (left + popupWidth > screenSize.width - padding) {
        // Spróbuj wyrównać popup do prawej krawędzi przycisku
        left = (position.dx + buttonSize.width - popupWidth).clamp(
          padding,
          screenSize.width - popupWidth - padding,
        );
      }
    }

    unawaited(
      showDialog<void>(
        animationStyle: AnimationStyle(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          reverseCurve: Curves.easeInOut,
          reverseDuration: const Duration(milliseconds: 350),
        ),
        context: context,
        barrierColor: Colors.transparent,
        builder: (context) => Stack(
          children: [
            // Invisible barrier to close popup
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(color: Colors.transparent),
            ),
            // Your custom widget positioned near the button
            Positioned(
              left: left,
              top: top,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(Sizes.p8),
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  padding: const EdgeInsets.all(Sizes.p16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Sizes.p4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(25),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  /// Content with closePopup callback
                  child: widget.content(() => Navigator.of(context).pop()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.type == Type.text
        ? TextButton.icon(
            // remove hover/overlay/splash effects
            style: TextButton.styleFrom(tapTargetSize: null).copyWith(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              splashFactory: NoSplash.splashFactory,
            ),
            icon: Icon(
              widget.icon,
              size: widget.iconSize,
              color: widget.iconColor,
            ),
            key: _buttonKey,
            onPressed: () {
              _showCustomPopup(context, _buttonKey);
            },
            label: Text(widget.textButton!),
          )
        : IconButton(
            key: _buttonKey,
            padding: EdgeInsets.zero,
            icon: Icon(
              widget.icon,
              size: widget.iconSize,
              color: widget.iconColor,
            ),
            onPressed: () {
              _showCustomPopup(context, _buttonKey);
            },
          );
  }
}
