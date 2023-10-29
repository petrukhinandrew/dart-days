import 'game_model.dart';
import 'package:flutter/material.dart' show Colors;

final _testRedCardPack =
    List.generate(3, (index) => CardModel(Colors.red, index + 1));
final _testOrangeCardPack =
    List.generate(5, (index) => CardModel(Colors.orange, index + 1));
final _testBlueCardPack =
    List.generate(2, (index) => CardModel(Colors.lightBlue, index + 1));
final _testYellowCardPack =
    List.generate(1, (index) => CardModel(Colors.yellow, index + 1));
final _testIndigoCardPack =
    List.generate(4, (index) => CardModel(Colors.indigo, index + 1));
final _testPurpleCardPack =
    List.generate(5, (index) => CardModel(Colors.purple, index + 1));

final List<PaletteModel> _testPalettes = List.generate(
    4,
    (index) => index == 3
        ? PaletteModel.fromCards(_testRedCardPack +
            _testIndigoCardPack +
            _testYellowCardPack +
            _testOrangeCardPack +
            _testBlueCardPack)
        : PaletteModel.fromCards(_testRedCardPack +
            [const CardModel(Colors.red, 5)] +
            _testIndigoCardPack +
            _testYellowCardPack +
            _testOrangeCardPack +
            _testBlueCardPack));

HandModel _testHand = HandModel([
  const CardModel(Colors.indigo, 3),
  const CardModel(Colors.red, 7),
  const CardModel(Colors.lightBlue, 4),
  const CardModel(Colors.green, 5),
]);

final DecksModel _testDecks = DecksModel(const CardModel(Colors.red, 4), 20);

final GameModel testModel4 = GameModel(
    numOfPlayers: 4,
    palettes: _testPalettes,
    hand: _testHand,
    decks: _testDecks);

final GameModel testModel2 = GameModel(
    numOfPlayers: 2,
    palettes: _testPalettes.take(2).toList(),
    hand: _testHand,
    decks: _testDecks);
