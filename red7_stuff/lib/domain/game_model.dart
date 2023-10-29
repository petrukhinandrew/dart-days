library game_model;

import 'package:flutter/material.dart' show Color, ChangeNotifier;
import 'package:collection/collection.dart' show groupBy;
import 'package:red7_stuff/utils/exceptions.dart';
import 'package:red7_stuff/utils/statics.dart';
import 'package:red7_stuff/utils/list_ops.dart';

part 'turn_validator.dart';
part 'card_model.dart';
part 'hand_model.dart';
part 'palette_model.dart';
part 'decks_model.dart';

class GameModel {
  final int numOfPlayers;

  final List<PaletteModel> palettes;
  PaletteModel get playerPalette => palettes.last;

  final HandModel hand;
  final DecksModel decks;

  GameModel(
      {required this.numOfPlayers,
      required this.palettes,
      required this.hand,
      required this.decks});

  void startTurn() {
    playerPalette.startTurn();
    decks.startTurn();
  }

  void endTurn() {
    bool turnIsValid = false;

    try {
      turnIsValid = _validateTurn();
    } catch (e) {
      if (e is TODO) {
        print("Got TODO");
      } else {
        print(e.toString());
      }
    }

    if (turnIsValid) {
      playerPalette.endTurn();
      decks.endTurn();
    } else {
      undo();
    }
  }

  bool _validateTurn() => TurnValidator.validate(this);

  void undo() {
    final fromPalette = playerPalette.undo();
    final fromCanvas = decks.undo();
    if (fromPalette == null && fromCanvas == null) return;

    final List<CardModel> undoCards = [
      fromCanvas ?? CardModel.blank(),
      fromPalette ?? CardModel.blank()
    ].where((element) => element != CardModel.blank()).toList();
    hand.putAll(undoCards);
    startTurn();
  }
}
