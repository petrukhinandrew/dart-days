import 'package:flutter/material.dart';

class ScrollableHomeWidget extends StatefulWidget {
  final Widget child;
  const ScrollableHomeWidget(this.child, {super.key});

  @override
  State<ScrollableHomeWidget> createState() =>
      _ScrollableHomeWidgetState(child);
}

class _ScrollableHomeWidgetState extends State<ScrollableHomeWidget> {
  final Widget child;
  _ScrollableHomeWidgetState(this.child);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Orientation"),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ))));
  }
}
