import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({super.key});

  @override
  State<AnimatedCrossFadeWidget> createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _crossFadeStateShowFirst = true;
  void _crossFade() {
    setState(() {
      _crossFadeStateShowFirst = !_crossFadeStateShowFirst;
    });
  }

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedCrossFade(
                firstChild: Container(
                  color: Colors.amber,
                  height: 100.0,
                  width: 100.0,
                ),
                secondChild: Container(
                  color: Colors.lightGreen,
                  height: 200.0,
                  width: 200.0,
                ),
                crossFadeState: _crossFadeStateShowFirst
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 500),
                sizeCurve: Curves.bounceIn,
              ),
              Positioned(
                  child: TextButton(
                child: const Text("tap me"),
                onPressed: () {
                  _crossFade();
                },
              ))
            ],
          )
        ],
      );
}
