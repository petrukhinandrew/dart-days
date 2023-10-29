import 'package:flutter/material.dart';

class GridViewCountWidget extends StatelessWidget {
  const GridViewCountWidget({super.key});

  @override
  Widget build(BuildContext context) => GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(16.0),
        children: List.generate(
            20,
            (index) => Card(
                  margin: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.coffee,
                          size: 48.0,
                          color: Colors.blue,
                        ),
                        const Divider(),
                        Text("Index $index",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16.0))
                      ],
                    ),
                    onTap: () => print("Card $index"),
                  ),
                )),
      );
}
