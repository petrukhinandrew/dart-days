import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(children: [
      IconButton(
          icon: const Icon(Icons.home),
          iconSize: 128.0,
          onPressed: () {
            print("Print is not the solution for debug");
          }),
    ]))));
  }
}
