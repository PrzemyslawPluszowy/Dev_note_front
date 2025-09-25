import 'dart:async';

import 'package:flutter/material.dart';
import 'package:p_utils/p_utils.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({
    required this.content,
    required this.icon,
    super.key,
    this.width = 200,
    this.height,
    this.iconColor,
    this.iconSize,
  });

  /// content builder with closePopup callback
  /// to close the popup from inside the content
  final Widget Function(VoidCallback closePopup) content;

  /// icon for the button that triggers the popup
  /// you can use any IconData here
  final IconData icon;

  /// optional icon color
  final Color? iconColor;

  /// optional icon size
  final double? iconSize;

  /// optional width for the popup
  final double width;

  /// optional height for the popup
  final double? height;

  /// Show the custom popup near the button
  void _showCustomPopup(BuildContext context, GlobalKey buttonKey) {
    final renderBox =
        buttonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final buttonSize = renderBox.size;

    /// Display the popup using showDialog
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
              left: position.dx,
              top:
                  position.dy +
                  buttonSize.height +
                  8, // Pod przyciskiem z małym marginesem
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(Sizes.p8),
                child: Container(
                  width: width,
                  height: height,
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
                  child: content(() => Navigator.of(context).pop()),
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
    final buttonKey = GlobalKey(); // Utwórz klucz tutaj

    return InkWell(
      key: buttonKey, // Przypisz klucz do InkWell
      onTap: () =>
          _showCustomPopup(context, buttonKey), // Użyj tego samego klucza
      child: Icon(icon, size: iconSize, color: iconColor),
    );
  }
}
