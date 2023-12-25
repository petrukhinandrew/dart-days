import 'package:flutter/material.dart';
import 'package:flutter_intro/pages/navigation/menu_home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Template',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MenuHomePage());
  }
}
