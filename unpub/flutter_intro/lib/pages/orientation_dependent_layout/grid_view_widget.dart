import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation orient = MediaQuery.of(context).orientation;
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: orient == Orientation.portrait ? 2 : 4,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.5,
      children: List.generate(
          8,
          (index) => Text(
                "Grid $index",
                textAlign: TextAlign.center,
              )),
    );
  }
}
