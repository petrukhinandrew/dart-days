import 'package:flutter/material.dart';
import 'package:flutter_intro/pages/sample.dart';

class BottomBarHome extends StatefulWidget {
  const BottomBarHome({super.key});

  @override
  State<BottomBarHome> createState() => _BottomBarHomeState();
}

class _BottomBarHomeState extends State<BottomBarHome> {
  final List<Widget> _listPages = [];
  late Widget _currentPage;
  late int _currentIndex;

  @override
  void initState() {
    _listPages
      ..add(const PageSample(
          "Birthdays",
          Icon(
            Icons.cake,
            color: Colors.orange,
            size: 200.0,
          )))
      ..add(const PageSample(
          "Gratitude",
          Icon(
            Icons.sentiment_satisfied,
            color: Colors.blue,
            size: 200.0,
          )))
      ..add(const PageSample(
          "Reminders",
          Icon(
            Icons.access_alarm,
            color: Colors.green,
            size: 200.0,
          )));
    _currentIndex = 0;
    _currentPage = _listPages.first;
    super.initState();
  }

  void _changePage(int idx) {
    setState(() {
      _currentIndex = idx;
      _currentPage = _listPages[idx];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bottom Nav Bar")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _currentPage,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: "Birthdays"),
          BottomNavigationBarItem(
              icon: Icon(Icons.sentiment_neutral), label: "Gratitude"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), label: "Reminders")
        ],
        onTap: (idx) => _changePage(idx),
      ),
    );
  }
}
