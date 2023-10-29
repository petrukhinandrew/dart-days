import 'package:flutter/material.dart';
import 'package:scrollable_reprs/widgets/stack_widget.dart';

class StackHomePage extends StatelessWidget {
  const StackHomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Stack example"),
        ),
        body: const SafeArea(child: StackWidget()),
      );
}
