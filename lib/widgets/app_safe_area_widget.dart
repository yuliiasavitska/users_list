import 'package:flutter/material.dart';

class AppSafeAreaWidget extends StatelessWidget {
  const AppSafeAreaWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).colorScheme.primary,
        child: SafeArea(
          child: Material(
            child: child,
          ),
        ),
      );
}
