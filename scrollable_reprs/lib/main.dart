import 'package:flutter/material.dart';
import 'package:scrollable_reprs/pages/scrollview_slivers.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scrollable App',
        theme: ThemeData(primarySwatch: Colors.lightGreen),
        home: const ScrollViewSliversPage(),
      );
}
