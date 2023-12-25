import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final int index;
  const HeaderWidget(this.index, {super.key});

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.all(16.0),
      height: 120.0,
      child: const Card(
          elevation: 8.0,
          color: Colors.white,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Barista",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48.0,
                  color: Colors.orange),
            ),
            Text(
              "Travel plans",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            )
          ])));
}
