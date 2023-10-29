import 'package:flutter/material.dart';
import 'package:flutter_intro/pages/navigation/menu_list.dart';

class MenuDrawerWidget extends StatelessWidget {
  const MenuDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          UserAccountsDrawerHeader(
            accountName: Text("Name"),
            accountEmail: Text("accountEmail"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/mountains.jpeg"),
                    fit: BoxFit.cover)),
          ),
          MenuList()
        ],
      ));
}

class MenuEndDrawerWidget extends StatelessWidget {
  const MenuEndDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
          child: ListView(
        children: const [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.sentiment_satisfied_alt,
              size: 128.0,
              color: Colors.white60,
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          const MenuList()
        ],
      ));
}
