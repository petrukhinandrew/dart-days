import 'package:flutter/material.dart';
import 'package:flutter_intro/pages/navigation/menu_drawer.dart';

class MenuHomePage extends StatelessWidget {
  const MenuHomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Page that holds menu drawers")),
        drawer: const MenuDrawerWidget(),
        endDrawer: const MenuEndDrawerWidget(),
        body: SafeArea(child: Container()),
      );
}
