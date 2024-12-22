import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BounceInAnimation extends HookWidget {
  final Widget child;
  final VoidCallback? onTap;

  const BounceInAnimation({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: const Duration(milliseconds: 100));

    final scale = Tween<double>(begin: 1.0, end: 0.9)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    return GestureDetector(
      onTap: onTap,
      child: Listener(
        onPointerDown: (PointerDownEvent event) {
          controller.forward();
        },
        onPointerUp: (PointerUpEvent event) {
          controller.reverse();
        },
        onPointerCancel: (event) {
          controller.reverse();
        },
        child: ScaleTransition(
          scale: scale,
          child: child,
        ),
      ),
    );
  }
}
