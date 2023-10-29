import 'package:flutter/material.dart';
import 'package:scrollable_reprs/widgets/header_widget.dart';
import 'package:scrollable_reprs/widgets/row_card.dart';
import 'package:scrollable_reprs/widgets/row_no_card.dart';

class ScrollableHome extends StatelessWidget {
  const ScrollableHome({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Scrollable app home"),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return switch (index) {
                0 => HeaderWidget(index),
                (>= 1 && <= 5) => RowCardWidget(index),
                _ => RowNoCardWidget(index)
              };
            },
          ),
        ),
      );
}
