import 'package:flutter/material.dart';

class SlideUpTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;

  const SlideUpTransition({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeIn,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (child, animation) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
      child: child,
    );
  }
}
