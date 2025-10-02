import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Simple placeholder child used to initialize Main's required child.
@RoutePage()
class MainChildPlaceholder extends StatelessWidget {
  const MainChildPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Select or create a board to get started!',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
