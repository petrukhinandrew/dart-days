import 'package:flutter/material.dart';
import 'package:scrollable_reprs/icon_list.dart';

class GridViewExtentWidget extends StatelessWidget {
  const GridViewExtentWidget({super.key});

  @override
  Widget build(BuildContext context) => GridView.extent(
        maxCrossAxisExtent: 175.0,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8.0),
        children: List.generate(
            20,
            (index) => Card(
                  margin: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          iconList[index],
                          size: 48.0,
                          color: Colors.blue,
                        ),
                        const Divider(),
                        Text(
                          "Index $index",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16.0),
                        )
                      ],
                    ),
                    onTap: () {
                      print("Card $index");
                    },
                  ),
                )),
      );
}
