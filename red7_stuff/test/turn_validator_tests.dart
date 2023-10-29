import 'package:red7_stuff/utils/statics.dart';
import 'package:test/test.dart';
import 'package:red7_stuff/domain/game_model.dart';
import 'dart:math' show Random;

void main() {
  group('RedScoreCounter', () {
    final counter = PaletteScoreCounter.byColor(GameCardColor.RED);
    test('smoke', () {
      final palette = PaletteModel.fromCards([
        const CardModel(GameCardColor.RED, 5),
        const CardModel(GameCardColor.BLUE, 6)
      ]);
      final score = counter.score(palette);
      expect(score.highest, const CardModel(GameCardColor.BLUE, 6));
      expect(score.asInt, 6363);
    });
    test('edge cases', () {
      final palette1 = PaletteModel.fromCards([
        const CardModel(GameCardColor.RED, 6),
        const CardModel(GameCardColor.ORANGE, 6)
      ]);
      final palette2 = PaletteModel.fromCards([
        const CardModel(GameCardColor.INDIGO, 7),
        const CardModel(GameCardColor.GREEN, 7)
      ]);
      expect(counter.score(palette1).highest,
          const CardModel(GameCardColor.RED, 6));
      expect(counter.score(palette2).highest,
          const CardModel(GameCardColor.GREEN, 7));
    });
  });
  group('OrangeScoreCounter', () {
    final counter = PaletteScoreCounter.byColor(GameCardColor.ORANGE);
    final rnd = Random();
    test('smoke', () {
      final palette = PaletteModel.fromCards([
        const CardModel(GameCardColor.YELLOW, 4),
        const CardModel(GameCardColor.RED, 4),
        const CardModel(GameCardColor.YELLOW, 1),
        const CardModel(GameCardColor.YELLOW, 5),
        const CardModel(GameCardColor.GREEN, 4)
      ]);
      final score = counter.score(palette);
      expect(score.score, 3);
      expect(score.highest, const CardModel(GameCardColor.RED, 4));
      expect(score.asInt, 347);
    });
    test('auto', () {
      int limit = rnd.nextInt(5) + 1;
      final palette = PaletteModel.fromCards([
        for (int i = 0; i < limit; ++i)
          for (int c = 0; c < limit; ++c) CardModel(colors[c], i)
      ]);
      final score = counter.score(palette);
      expect(score.score, limit);
      expect(score.highest, CardModel(colors[0], limit - 1));
    });
  });
}
