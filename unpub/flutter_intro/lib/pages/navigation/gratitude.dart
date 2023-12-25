import 'package:flutter/material.dart';

class GratitudePage extends StatefulWidget {
  final int radioGroupValue;
  const GratitudePage({required this.radioGroupValue, super.key});

  @override
  State<GratitudePage> createState() => _GratitudePageState();
}

class _GratitudePageState extends State<GratitudePage> {
  final List<String> _gratitudeList = [];
  String? _selectedGratitude;
  int _radioGroupValue = 0;

  void _radioOnChanged(int index) {
    setState(() {
      _radioGroupValue = index;
      _selectedGratitude = _gratitudeList[index];
      print('selected radio value: $_selectedGratitude');
    });
  }

  @override
  void initState() {
    super.initState();
    _gratitudeList
      ..add("Family")
      ..add("Friends")
      ..add("Coffee");
    _radioGroupValue = widget.radioGroupValue;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Gratitude"),
          actions: [
            IconButton(
                onPressed: () => Navigator.pop(context, _selectedGratitude),
                icon: const Icon(Icons.check))
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text("Gratitude"),
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: _radioGroupValue,
                      onChanged: (index) => _radioOnChanged(index!),
                    ),
                    const Text('Family'),
                    Radio(
                      value: 1,
                      groupValue: _radioGroupValue,
                      onChanged: (index) => _radioOnChanged(index!),
                    ),
                    const Text("Friends"),
                    Radio(
                      value: 2,
                      groupValue: _radioGroupValue,
                      onChanged: (index) => _radioOnChanged(index!),
                    ),
                    const Text('Coffee')
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
