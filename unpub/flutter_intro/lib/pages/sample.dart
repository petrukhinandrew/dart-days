import 'package:flutter/material.dart';

class PageSample extends StatelessWidget {
  final Icon icon;
  final String title;
  const PageSample(this.title, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: icon)),
    );
  }
}
