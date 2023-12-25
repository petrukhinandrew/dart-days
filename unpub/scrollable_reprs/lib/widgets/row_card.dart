import 'package:flutter/material.dart';

class RowCardWidget extends StatelessWidget {
  const RowCardWidget(this.index, {super.key});
  final int index;

  @override
  Widget build(BuildContext context) => Card(
      child: ListTile(
          leading: const Icon(
            Icons.flight,
            size: 48.0,
            color: Colors.lightBlue,
          ),
          title: Text("Airplane $index"),
          subtitle: const Text("Subtitle"),
          trailing: Text(
            "${index * 7} %",
            style: const TextStyle(color: Colors.lightBlue),
          ),
          onTap: () {
            print("tap on $index");
          }));
}
