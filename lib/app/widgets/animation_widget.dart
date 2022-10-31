import 'package:flutter/material.dart';

class TranslateAnimation extends StatelessWidget {
  const TranslateAnimation({
    Key? key,
    this.duration = const Duration(milliseconds: 800),
    this.child,
    this.offset = 40.0,
    this.curve = Curves.fastOutSlowIn,
    this.offsetDirection = Axis.vertical,
  }) : super(key: key);

  final Widget? child;
  final Duration? duration;
  final double? offset;
  final Curve? curve;
  final Axis? offsetDirection;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration!,
      curve: curve!,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, double? value, child) {
        return Transform.translate(offset: offsetDirection == Axis.horizontal ? Offset(value! * offset!, 0) : Offset(0, value! * offset!), child: child);
      },
      child: child,
    );
  }
}

class OpacityAnimation extends StatelessWidget {
  const OpacityAnimation({
    Key? key,
    this.duration = const Duration(milliseconds: 1000),
    this.child,
    this.curve = Curves.ease,
    this.begin = 0.0,
    this.end = 1.0,
  }) : super(key: key);

  final Widget? child;
  final Duration? duration;
  final Curve? curve;
  final double? begin;
  final double? end;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration!,
      curve: curve!,
      tween: Tween(begin: begin, end: end),
      builder: (context, double? value, child) {
        return Opacity(
          opacity: value!,
          child: child,
        );
      },
      child: child,
    );
  }
}

class ScaleAnimation extends StatelessWidget {
  const ScaleAnimation({
    Key? key,
    this.duration = const Duration(milliseconds: 800),
    required this.child,
    this.curve = Curves.fastOutSlowIn,
    this.initScale = 0.0,
    this.finalScale = 1.0,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final double initScale;
  final double finalScale;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      curve: curve,
      tween: Tween(begin: initScale, end: finalScale),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }
}

class TextAnimation extends StatelessWidget {
  const TextAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OpacityAnimation(duration: const Duration(milliseconds: 3000), child: child);
  }
}
