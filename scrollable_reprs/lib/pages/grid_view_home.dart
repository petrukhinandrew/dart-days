import 'package:flutter/material.dart';
import 'package:scrollable_reprs/widgets/grid_view_extent.dart';

class GridViewHome extends StatelessWidget {
  const GridViewHome({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Grid view example"),
        centerTitle: true,
      ),
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridViewExtentWidget(),
      )));
}
