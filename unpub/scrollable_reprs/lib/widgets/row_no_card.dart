import 'package:flutter/material.dart';

class RowNoCardWidget extends StatelessWidget {
  const RowNoCardWidget(this.index, {super.key});
  final int index;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: const Icon(
          Icons.directions_car,
          size: 48.0,
          color: Colors.lightGreen,
        ),
        title: Text('Car $index'),
        subtitle: const Text('Subtitle'),
        trailing: CheckableBookmarkWidget((index % 3).isEven),
        selected: false,
        onTap: () {
          print('Tapped on Row $index');
        },
      );
}

class CheckableBookmarkWidget extends StatefulWidget {
  bool _checked;
  CheckableBookmarkWidget(this._checked, {super.key});

  @override
  State<CheckableBookmarkWidget> createState() =>
      _CheckableBookmarkWidgetState();
}

class _CheckableBookmarkWidgetState extends State<CheckableBookmarkWidget> {
  late Icon _icon;

  @override
  void initState() {
    super.initState();

    setState(() {
      _icon = Icon(widget._checked ? Icons.bookmark : Icons.bookmark_border);
    });
  }

  void _check() {
    setState(() {
      widget._checked = !widget._checked;
      _icon = Icon(widget._checked ? Icons.bookmark : Icons.bookmark_border);
    });
  }

  @override
  Widget build(BuildContext context) =>
      IconButton(onPressed: _check, icon: _icon);
}
