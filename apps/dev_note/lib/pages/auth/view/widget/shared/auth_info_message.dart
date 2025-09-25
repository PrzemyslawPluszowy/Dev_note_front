import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:p_utils/p_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AuthInfoMessage extends StatelessWidget {
  const AuthInfoMessage({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.p8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(Sizes.p8),
      ),
      child: Row(
        children: [
          Icon(
            PhosphorIcons.checkCircle(
              PhosphorIconsStyle.thin,
            ),
            color: const Color.fromARGB(255, 17, 129, 21),
          ),
          gapW8,
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Color.fromARGB(255, 17, 129, 21),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms);
  }
}
