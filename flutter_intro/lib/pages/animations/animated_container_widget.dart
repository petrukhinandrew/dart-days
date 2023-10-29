import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  final double _height = 100.0;
  double _width = 100.0;
  void _increaseWidth() {
    setState(() {
      _width += _width >= 320.0 ? 0.0 : 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.elasticOut,
            color: Colors.amber,
            height: _height,
            width: _width,
            child: TextButton(
              child: const Text("Tap to increase width"),
              onPressed: () {
                _increaseWidth();
              },
            ))
      ],
    );
  }
}
