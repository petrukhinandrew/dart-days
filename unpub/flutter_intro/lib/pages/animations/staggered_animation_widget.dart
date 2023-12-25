import 'package:flutter/material.dart';

class StaggeredAnimationWidget extends StatefulWidget {
  const StaggeredAnimationWidget({super.key});

  @override
  State<StaggeredAnimationWidget> createState() =>
      _StaggeredAnimationWidgetState();
}

class _StaggeredAnimationWidgetState extends State<StaggeredAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animFloatUp;
  late Animation<double> _animGrowSize;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double bHeight = MediaQuery.of(context).size.height / 2;
    double bWidth = MediaQuery.of(context).size.width / 3;
    double bBotLocation = MediaQuery.of(context).size.height - bHeight;
    _animFloatUp = Tween(begin: bBotLocation, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.fastOutSlowIn)));
    _animGrowSize = Tween(begin: 50.0, end: bWidth).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.elasticInOut)));
    return AnimatedBuilder(
      animation: _animFloatUp,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.only(top: _animFloatUp.value),
          width: _animGrowSize.value,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Image.asset("assets/images/baloon.png"),
      ),
    );
  }
}
