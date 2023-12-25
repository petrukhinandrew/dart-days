import 'package:flutter/material.dart';

class OrientationBuilderWidget extends StatelessWidget {
  const OrientationBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      OrientationBuilder(builder: (BuildContext context, Orientation orient) {
        return orient == Orientation.portrait
            ? _portraitView()
            : _landscapeView();
      });
  Widget _portraitView() => Container(
        alignment: Alignment.center,
        color: Colors.yellow.shade100,
        height: 100.0,
        width: 100.0,
        child: const Text("Portrait"),
      );
  Widget _landscapeView() => Container(
        alignment: Alignment.center,
        color: Colors.lightGreen.shade200,
        height: 100.0,
        width: 200.0,
        child: const Text("Landscape"),
      );
}
