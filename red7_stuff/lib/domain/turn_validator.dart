part of game_model;

class PaletteScore {
  final int score;
  final CardModel highest;
  const PaletteScore(this.score, this.highest);

  int get asInt => score * 100 + highest.score;

  @override
  String toString() => asInt.toString();
}

mixin class _CardCounter {
  List<CardModel> flatCards(PaletteModel palette) => palette.cards.flatten();

  CardModel highestCard(List<CardModel> cards) => cards.maxBy((c) => c.score);
}

abstract class PaletteScoreCounter with _CardCounter {
  const PaletteScoreCounter();

  factory PaletteScoreCounter.byColor(Color color) {
    switch (color) {
      case GameCardColor.RED:
        return _RedScoreCounter();
      case GameCardColor.ORANGE:
        return _OrangeScoreCounter();
      case GameCardColor.YELLOW:
        return _YellowScoreCounter();
      case GameCardColor.GREEN:
        return _GreenScoreCounter();
      case GameCardColor.BLUE:
        return _BlueScoreCounter();
      case GameCardColor.INDIGO:
        return _IndigoScoreCounter();
      case GameCardColor.PURPLE:
        return _PurpleScoreCounter();
      default:
        throw UnknownCardColor();
    }
  }
  PaletteScore score(PaletteModel palette);
}

class _RedScoreCounter extends PaletteScoreCounter {
  @override
  PaletteScore score(PaletteModel palette) {
    final highest = highestCard(palette.cards.flatten());
    return PaletteScore(highest.score, highest);
  }
}

class _OrangeScoreCounter extends PaletteScoreCounter {
  @override
  PaletteScore score(PaletteModel palette) {
    Map<int, List<CardModel>> ordered =
        groupBy(flatCards(palette), (c) => c.value);
    int big = -1;
    for (int v = 7; v > 0; --v) {
      if (ordered.containsKey(v)) {
        if (big == -1 || ordered[v]!.length > ordered[big]!.length) big = v;
      }
    }
    return PaletteScore(ordered[big]!.length, highestCard(ordered[big]!));
  }
}

class _YellowScoreCounter extends PaletteScoreCounter {
  @override
  PaletteScore score(PaletteModel palette) {
    final packs = palette.cards;
    int big = 0;
    for (int i = 1; i < packs.length; ++i) {
      if (packs[i].length > packs[big].length) big = i;
    }
    return PaletteScore(packs[big].length, highestCard(packs[big]));
  }
}

class _GreenScoreCounter extends PaletteScoreCounter {
  @override
  PaletteScore score(PaletteModel palette) {
    final even = flatCards(palette).filterBy((card) => card.value % 2 == 0);
    final highest = highestCard(even);
    return PaletteScore(even.length, highest);
  }
}

class _BlueScoreCounter extends PaletteScoreCounter {
  @override
  PaletteScore score(PaletteModel palette) =>
      PaletteScore(palette.cards.length, highestCard(flatCards(palette)));
}

class _IndigoScoreCounter extends PaletteScoreCounter {
  @override
  PaletteScore score(PaletteModel palette) {
    List<CardModel> tops = [for (int i = 0; i < 7; ++i) CardModel.blank()];
    List<CardModel> longest = [];
    List<CardModel> curRun = [];

    for (CardModel card in palette.cards.flatten()) {
      if (tops[card.value] == CardModel.blank() ||
          tops[card.value].color.score < card.color.score) {
        tops[card.value] = card;
      }
    }

    for (CardModel card in tops) {
      if (card == CardModel.blank()) {
        longest = longest.length > curRun.length ? longest : curRun;
        curRun = [];
      }
    }
    longest = longest.length > curRun.length ? longest : curRun;
    return PaletteScore(longest.length, highestCard(longest));
  }
}

class _PurpleScoreCounter extends PaletteScoreCounter {
  @override
  PaletteScore score(PaletteModel palette) {
    final limited = flatCards(palette).filterBy((card) => card.value < 4);
    return PaletteScore(limited.length, highestCard(limited));
  }
}

class TurnValidator {
  static bool validate(GameModel model) {
    if (model.decks.prevPlayed == null) return false;
    final PaletteScoreCounter scoreCounter =
        PaletteScoreCounter.byColor(model.decks.canvas.color);
    List<PaletteScore> scores =
        model.palettes.map((palette) => scoreCounter.score(palette)).toList();

    return scores.maxBy((paletteScore) => paletteScore.asInt).asInt ==
        scores.last.asInt;
  }
}
