import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Stack(children: [
          Expanded(
              child: Image(
                  image: AssetImage('assets/images/mountains.jpeg'),
                  filterQuality: FilterQuality.high,
                  width: 500.0,
                  fit: BoxFit.contain)),
          Positioned(
              top: 0.0,
              right: 0.0,
              child: FractionalTranslation(
                  translation: Offset(0.3, -0.3),
                  child: CircleAvatar(
                      radius: 24.0,
                      backgroundColor: Colors.black38,
                      child: Icon(
                        Icons.star,
                        size: 24.0,
                        color: Colors.white38,
                      )))),
          Positioned(
              bottom: 10.0,
              left: 10.0,
              child: Icon(
                Icons.cake,
                size: 24.0,
                color: Colors.lightBlue,
              ))
        ]),
      );
}
