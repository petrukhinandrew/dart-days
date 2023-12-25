import 'package:flutter/material.dart';
import 'package:flutter_intro/pages/orientation_dependent_layout/grid_view_widget.dart';
import 'package:flutter_intro/pages/orientation_dependent_layout/orientation_icons_widget.dart';
import 'package:flutter_intro/pages/orientation_dependent_layout/orientation_builder_widget.dart';

class OrientationDependentHome extends StatefulWidget {
  const OrientationDependentHome({super.key});

  @override
  State<OrientationDependentHome> createState() =>
      OrientationDependentHomeState();
}

class OrientationDependentHomeState extends State<OrientationDependentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Orientation"),
        ),
        body: const SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  OrientationLayoutIconsWidget(),
                  Divider(),
                  GridViewWidget(),
                  Divider(),
                  OrientationBuilderWidget()
                ],
              ),
            ),
          ),
        ));
  }
}
