import 'package:flutter/material.dart';
import 'package:flutter_intro/pages/navigation/about.dart';
import 'package:flutter_intro/pages/navigation/gratitude.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String _sup = "";

  void _openPageGratitude(BuildContext context,
      {bool fullScreenDialog = true}) async {
    final String? response = await Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: fullScreenDialog,
            builder: (context) => const GratitudePage(radioGroupValue: -1)));
    if (response != null) {
      setState(() {
        _sup = response;
      });
    }
  }

  void _openPageAbout(BuildContext context, {bool fullScreenDialog = true}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: fullScreenDialog,
            builder: (context) => const AboutPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigator"),
        actions: [
          IconButton(
              onPressed: () {
                _openPageAbout(context, fullScreenDialog: true);
              },
              icon: const Icon(Icons.info_outline)),
          IconButton(
              onPressed: () {
                _openPageGratitude(context, fullScreenDialog: false);
              },
              icon: const Icon(Icons.thumb_up))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Home page $_sup",
          textAlign: TextAlign.center,
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openPageAbout(context),
        tooltip: "About",
        child: const Icon(Icons.sentiment_satisfied),
      ),
    );
  }
}
