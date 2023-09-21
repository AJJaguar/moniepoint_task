
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';



class FaderWidget extends HookWidget implements PreferredSizeWidget {
  final Widget child;
  final int milliSecWait;
  final AnimationController? controller;
  final Animation<double>? animation;
  final Curve? curve;
  final Offset? offset;
  final double? size;
  const FaderWidget(
      {super.key,
      required this.child,
      this.milliSecWait = 0,
      this.controller,
      this.animation,
      this.curve,
      this.size,
      this.offset});

  @override
  Widget build(BuildContext context) {
    final control = controller ??
        useAnimationController(duration: const Duration(milliseconds: 500));
    Future.delayed(
      Duration(milliseconds: milliSecWait),
      () => control.forward(),
    );

    Animation<Offset> animation;
    if (curve != null) {
      final Tween<Offset> tween = Tween<Offset>(
        begin: offset ?? const Offset(1, 0),
        end: Offset.zero,
      );
      final curvedAnimation = CurvedAnimation(parent: control, curve: curve!);
      animation = tween.animate(curvedAnimation);
    } else {
      final tween = Tween<Offset>(
        begin: offset ?? const Offset(0, 0.2),
        end: const Offset(0, 0),
      );
      animation = tween.animate(control);
    }
    return SlideTransition(
      position: animation,
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(control),
        child: child,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return Size.fromHeight(size ?? 30.0);
  }
}