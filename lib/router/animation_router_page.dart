import 'package:flutter/material.dart';

PageRouteBuilder animationRouterPage({
  required Widget page,
  Duration transitionDuration = const Duration(milliseconds: 500),
  Duration reverseTransitionDuration = const Duration(milliseconds: 500),
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: transitionDuration,
    reverseTransitionDuration: reverseTransitionDuration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curve = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
      return FadeTransition(
        opacity: curve,
        child: ScaleTransition(
          scale: Tween<double>(
            begin: 0.8,
            end: 1.0,
          ).animate(curve),
          child: child,
        ),
      );
    },
  );
}