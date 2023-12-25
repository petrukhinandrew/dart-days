import 'package:flutter/material.dart';

class HeroAnimation extends StatefulWidget {
  const HeroAnimation({super.key});

  @override
  State<HeroAnimation> createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hero Animation")),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                child: Hero(
                    tag: 'format_print',
                    child: Icon(
                      Icons.format_paint_rounded,
                      color: Colors.lightGreen.shade200,
                      size: 120.0,
                    )),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FlyWidget()));
                },
              ))),
    );
  }
}

class FlyWidget extends StatelessWidget {
  const FlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.shortestSide / 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fly"),
      ),
      body: SafeArea(
          child: Hero(
              tag: 'format_print',
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Icon(Icons.format_paint_rounded,
                    color: Colors.lightGreen.shade200, size: width),
              ))),
    );
  }
}
