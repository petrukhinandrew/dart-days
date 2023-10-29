import 'package:flutter/material.dart' show Colors;
import 'package:red7_stuff/domain/game_model.dart';
import 'package:test/test.dart';

void main() {
  group('Hand', () {
    test('Remove card', () {
      final hand = HandModel(
          [const CardModel(Colors.red, 7), const CardModel(Colors.purple, 1)]);
      hand.remove(const CardModel(Colors.purple, 1));
      expect(hand.cards, [const CardModel(Colors.red, 7)]);
    });
    test('Put card', () {
      final hand = HandModel(
          [const CardModel(Colors.red, 7), const CardModel(Colors.purple, 1)]);
      hand.put(const CardModel(Colors.purple, 2));
      expect(hand.cards, [
        const CardModel(Colors.red, 7),
        const CardModel(Colors.purple, 1),
        const CardModel(Colors.purple, 2)
      ]);
    });
  });

  group('Decks', () {
    test('Put', () {
      final decks = DecksModel(const CardModel(Colors.red, 7), 1);
      const newCard = CardModel(Colors.yellow, 4);
      decks.put(newCard);
      expect(decks.canvas, newCard);
    });
  });
  group('Palette', () {
    test('Contains', () {
      final palette = PaletteModel.fromCards(List.generate(
              6, (index) => CardModel(Colors.orange, index + 1)) +
          List.generate(2, (index) => CardModel(Colors.lightBlue, index + 1)) +
          List.generate(1, (index) => CardModel(Colors.yellow, index + 1)) +
          List.generate(4, (index) => CardModel(Colors.indigo, index + 1)));
      expect(palette.contains(const CardModel(Colors.lightBlue, 1)), true);
      expect(palette.contains(const CardModel(Colors.lightBlue, 3)), false);
      expect(palette.contains(const CardModel(Colors.red, 5)), false);
      expect(palette.contains(const CardModel(Colors.orange, 6)), true);
      expect(palette.contains(const CardModel(Colors.orange, 7)), false);
    });
    test('Put', () {
      final palette = PaletteModel.fromCards(List.generate(
              6, (index) => CardModel(Colors.orange, index + 1)) +
          List.generate(2, (index) => CardModel(Colors.lightBlue, index + 1)) +
          List.generate(1, (index) => CardModel(Colors.yellow, index + 1)) +
          List.generate(4, (index) => CardModel(Colors.indigo, index + 1)));
      expect(palette.put(const CardModel(Colors.red, 1)), true);
      expect(palette.put(const CardModel(Colors.orange, 4)), false);

      expect(palette.cards.length, 5);
      expect(palette.cards.last, [const CardModel(Colors.red, 1)]);
    });
  });
}
