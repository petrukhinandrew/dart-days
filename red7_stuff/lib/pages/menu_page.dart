import 'package:flutter/material.dart';
import 'package:red7_stuff/pages/ingame_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Red 7 Stuff', style: TextStyle(fontSize: 70.0)),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FilledButton.icon(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(5.0),
                          fixedSize: const MaterialStatePropertyAll(
                              Size(450.0, 150.0)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => InGamePage(2))));
                        },
                        icon: const Icon(
                          Icons.gamepad,
                          size: 50.0,
                        ),
                        label: const Text("2 players view",
                            style: TextStyle(fontSize: 50.0))),
                  ),
                  FilledButton.icon(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(5.0),
                        fixedSize:
                            const MaterialStatePropertyAll(Size(450.0, 150.0)),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => InGamePage(4))));
                      },
                      icon: const Icon(
                        Icons.gamepad,
                        size: 50.0,
                      ),
                      label: const Text(
                        "4 players view",
                        style: TextStyle(fontSize: 50.0),
                      ))
                ]),
          ),
        ),
      );
}
