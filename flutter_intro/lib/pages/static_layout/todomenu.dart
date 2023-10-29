import 'package:flutter/material.dart';

class ToDoMenuItem {
  final Icon icon;
  final Text text;
  const ToDoMenuItem(this.icon, this.text);
  @override
  String toString() => text.data ?? "null";
}

List<ToDoMenuItem> menuItems = [
  const ToDoMenuItem(Icon(Icons.fastfood), Text("FastFood")),
  const ToDoMenuItem(
      Icon(Icons.airplanemode_active_outlined), Text("AirplaneMode")),
  const ToDoMenuItem(Icon(Icons.place), Text("Place")),
  const ToDoMenuItem(Icon(Icons.music_note), Text("MusicNote")),
];

class ToDoMenuButton extends StatelessWidget {
  const ToDoMenuButton({super.key});

  @override
  Widget build(BuildContext context) => PopupMenuButton(
      icon: const Icon(Icons.view_list),
      onSelected: (sel) {
        print("selected: ${sel.toString()}");
      },
      itemBuilder: (BuildContext context) {
        return menuItems
            .map((menuItem) => PopupMenuItem(
                onTap: () {
                  print("Tapped ${menuItem.toString()}");
                },
                child: Row(
                  children: [
                    menuItem.icon,
                    const Padding(padding: EdgeInsets.all(8.0)),
                    menuItem.text
                  ],
                )))
            .toList();
      });
}

class ToDoMenuWidget extends StatelessWidget implements PreferredSizeWidget {
  const ToDoMenuWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(75.0);

  @override
  Widget build(BuildContext context) => Container(
      color: Colors.lightGreen.shade100,
      height: preferredSize.height,
      width: double.infinity,
      child: const Align(
        alignment: Alignment.centerRight,
        child: ToDoMenuButton(),
      ));
}
