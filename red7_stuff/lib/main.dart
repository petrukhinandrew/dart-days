import 'package:flutter/material.dart';
import 'package:red7_stuff/pages/menu_page.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MenuPage(),
      );
}
