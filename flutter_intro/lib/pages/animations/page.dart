import 'package:flutter/material.dart';
import 'package:flutter_intro/pages/scrollable_home/scrollable_home.dart';
import 'package:flutter_intro/pages/animations/animations.dart';

Widget animationPage() => const ScrollableHomeWidget(Column(
      children: [
        AnimatedContainerWidget(),
        Divider(),
        AnimatedCrossFadeWidget(),
        Divider(),
        AnimatedOpacityWidget(),
        Divider(),
        AnimationControllerWidget(),
        Divider(),
        StaggeredAnimationWidget()
      ],
    ));
