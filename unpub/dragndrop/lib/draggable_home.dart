import 'package:flutter/material.dart';

class DraggableHome extends StatefulWidget {
  const DraggableHome({super.key});

  @override
  State<DraggableHome> createState() => _DraggableHomeState();
}

GestureDetector buildGestureDetector() => GestureDetector(
      onTap: () => print("Gesture detector: tap"),
      onDoubleTap: () => print("Gesture detector: double tap"),
      onLongPress: () => print("Gesture detector: long press"),
      onPanUpdate: (details) => print("Gesture detector: pan update $details"),
      child: Container(
          width: double.infinity,
          height: 200.0,
          decoration:
              BoxDecoration(border: Border.all(width: 2.0, color: Colors.red))),
    );
Draggable<int> buildDraggable() => Draggable(
      childWhenDragging: const Icon(
        Icons.palette,
        color: Colors.grey,
        size: 48.0,
      ),
      feedback: const Icon(
        Icons.brush,
        color: Colors.deepOrange,
        size: 80.0,
      ),
      data: Colors.deepOrange.value,
      child: const Column(children: [
        Icon(
          Icons.palette,
          size: 48.0,
          color: Colors.deepOrange,
        ),
        Text("Drag me to change the color")
      ]),
    );

Color _paintedColor = Colors.grey;
DragTarget<int> buildDragTarget() => DragTarget<int>(
    onAccept: (val) {
      _paintedColor = Color(val);
    },
    builder: ((context, candidateData, rejectedData) => candidateData.isEmpty
        ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Drag to and see the color",
              style: TextStyle(color: _paintedColor),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Painting color: $candidateData",
              style: TextStyle(
                  color: Color(candidateData[0] ?? Colors.grey.value),
                  fontWeight: FontWeight.bold),
            ),
          )));

class _DraggableHomeState extends State<DraggableHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Drag'n'Drop",
          style: TextStyle(fontSize: 48.0),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  buildGestureDetector(),
                  const Divider(
                    color: Colors.black,
                    height: 44.0,
                  ),
                  buildDraggable(),
                  const Divider(
                    color: Colors.black,
                    height: 44.0,
                  ),
                  buildDragTarget()
                ],
              ))),
    );
  }
}
