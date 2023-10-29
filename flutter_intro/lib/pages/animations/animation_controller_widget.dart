import 'package:flutter/material.dart';

class AnimationControllerWidget extends StatefulWidget {
  const AnimationControllerWidget({super.key});

  @override
  State<AnimationControllerWidget> createState() =>
      _AnimationControllerWidgetState();
}

class _AnimationControllerWidgetState extends State<AnimationControllerWidget>
    with TickerProviderStateMixin {
  late AnimationController _ctrlFloatUp;
  late AnimationController _ctrlGrowSize;
  late Animation<double> _animFloatUp;
  late Animation<double> _animGrowSize;

  @override
  void initState() {
    super.initState();
    _ctrlFloatUp =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _ctrlGrowSize =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _ctrlFloatUp.dispose();
    _ctrlGrowSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double bHeight = MediaQuery.of(context).size.height / 2;
    double bWidth = MediaQuery.of(context).size.width / 3;
    double bBotLocation = MediaQuery.of(context).size.height - bHeight;
    _animFloatUp = Tween(begin: bBotLocation, end: 0.0).animate(CurvedAnimation(
        parent: _ctrlFloatUp, curve: Curves.fastEaseInToSlowEaseOut));
    _animGrowSize = Tween(begin: 50.0, end: bWidth).animate(
        CurvedAnimation(parent: _ctrlGrowSize, curve: Curves.elasticInOut));
    _ctrlFloatUp.forward();
    _ctrlGrowSize.forward();
    return AnimatedBuilder(
      animation: _animFloatUp,
      builder: (context, child) => Container(
        margin: EdgeInsets.only(top: _animFloatUp.value),
        width: _animGrowSize.value,
        child: child,
      ),
      child: GestureDetector(
          onTap: () {
            if (_ctrlFloatUp.isCompleted) {
              _ctrlFloatUp.reverse();
              _ctrlGrowSize.reverse();
            } else {
              _ctrlFloatUp.forward();
              _ctrlGrowSize.forward();
            }
          },
          child: Image.asset(
            'assets/images/baloon.png',
            width: bWidth,
            height: bHeight,
          )),
    );
  }
}
