import 'package:flutter/material.dart';

extension ColorScore on Color {
  int get score {
    return switch (this) {
      GameCardColor.RED => 7,
      GameCardColor.ORANGE => 6,
      GameCardColor.YELLOW => 5,
      GameCardColor.GREEN => 4,
      GameCardColor.BLUE => 3,
      GameCardColor.INDIGO => 2,
      GameCardColor.PURPLE => 1,
      _ => 0
    };
  }
}

extension ColorShortString on Color {
  String get letter {
    return switch (this) {
      Colors.red => "R",
      Colors.orange => "O",
      Colors.yellow => "Y",
      Colors.green => "G",
      Colors.blue => "B",
      Colors.indigo => "I",
      Colors.purple => "P",
      _ => "?"
    };
  }
}

class GameCardColor {
  static const Color RED = Colors.red;
  static const Color ORANGE = Colors.orange;
  static const Color YELLOW = Colors.yellow;
  static const Color GREEN = Colors.green;
  static const Color BLUE = Colors.lightBlue;
  static const Color INDIGO = Colors.indigo;
  static const Color PURPLE = Colors.purple;
  static const Color BLACK = Colors.black;
}

class GameResponseColor {
  static Color ACCEPT = Colors.lightGreen.shade200;
  static Color REJECT = Colors.red.shade200;
  static Color INACTIVE = Colors.transparent;
  static Color DECKS_BACK_INACTIVE = Colors.white;
  static Color DECKS_BORDER_INACTIVE = Colors.black;
}

final List<Color> colors = [
  GameCardColor.RED,
  GameCardColor.ORANGE,
  GameCardColor.YELLOW,
  GameCardColor.GREEN,
  GameCardColor.BLUE,
  GameCardColor.INDIGO,
  GameCardColor.PURPLE,
];

final List<int> cardValues = List.generate(7, (index) => index + 1);

const double cardWidthFactor = 0.1;
const double cardHeightFactor = 0.15;

const double packWidthFactor = 0.12;
const double packHeightFactor = 0.18;

const double cardAspectRatio = 64.0 / 89.0;
