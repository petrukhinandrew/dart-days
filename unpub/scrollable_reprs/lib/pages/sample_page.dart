import 'package:flutter/material.dart';

class PageSample extends StatelessWidget {
  final Icon icon;
  final String title;
  const PageSample(this.title, this.icon, {super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 50.0),
                )),
            Expanded(
              child: Align(alignment: Alignment.center, child: icon),
            )
          ],
        )),
      );
}

Widget remindersPage = const PageSample(
    "Reminders",
    Icon(
      Icons.alarm,
      size: 250.0,
    ));
Widget gratitudesPage() => const PageSample(
    "Gratitudes",
    Icon(
      Icons.sentiment_satisfied_alt_rounded,
      size: 250.0,
      color: Colors.lightBlue,
    ));
