import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("About"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              const Center(
                child: Text(" 'About' page "),
              ),
              Container(
                color: Colors.amber.shade100,
              )
            ]),
          ),
        ),
      );
}
