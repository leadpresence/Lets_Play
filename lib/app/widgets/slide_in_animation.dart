import 'package:flutter/material.dart';

class SlideInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final bool reverse;
  final double direction, distance;
  const SlideInAnimation({
    // try adding const and see what happens
    this.duration = const Duration(milliseconds: 700),
    this.reverse = false,
    this.direction = 0,
    this.distance = 1.0,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  _SlideInAnimationState createState() => _SlideInAnimationState();
}

class _SlideInAnimationState extends State<SlideInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _position;
  late Animation<double> _opacity;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _position = Tween<Offset>(
      begin: Offset.fromDirection(widget.direction, widget.distance),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0, 1, curve: Curves.decelerate),
    ));

    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0, .9),
    ));

    widget.reverse
        ? _controller.reverse(from: _controller.upperBound)
        : _controller.forward(from: _controller.lowerBound);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _position,
      child: FadeTransition(
        opacity: _opacity,
        child: widget.child,
      ),
    );
  }
}
