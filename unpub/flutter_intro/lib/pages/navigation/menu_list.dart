import 'package:flutter/material.dart';
import 'package:flutter_intro/pages/navigation/about.dart';
import 'package:flutter_intro/pages/navigation/bottom_bar.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          ListTile(
              leading: const Icon(Icons.miscellaneous_services),
              title: const Text("Misc"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomBarHome()));
              }),
          ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text("About"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutPage()));
              }),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.restart_alt),
            title: const Text("Navigator pop"),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      );
}
