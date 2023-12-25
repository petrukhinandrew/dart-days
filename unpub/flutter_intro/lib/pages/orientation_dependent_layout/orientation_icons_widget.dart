import 'package:flutter/material.dart';

class OrientationLayoutIconsWidget extends StatelessWidget {
  const OrientationLayoutIconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? _portraitOrient()
        : _landscapeOrient();
  }

  Widget _portraitOrient() => const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.school, size: 48.0)],
      );

  Widget _landscapeOrient() => const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.brush, size: 48.0),
          Icon(Icons.school, size: 48.0)
        ],
      );
}
