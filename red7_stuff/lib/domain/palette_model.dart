part of game_model;

class PaletteModel extends ChangeNotifier {
  bool _isAccepting = false;
  CardModel? _lastAccepted;
  CardModel? get lastAccepted => _lastAccepted;
  bool get isAccepting => _isAccepting;

  final Map<Color, List<CardModel>> _cards;

  List<List<CardModel>> get cards =>
      _cards.entries.map((e) => e.value).toList();

  PaletteModel.fromCards(List<CardModel> from)
      : _cards = groupBy(from, (CardModel c) => c.color);

  bool contains(CardModel card) =>
      _cards.containsKey(card.color) &&
      (_cards[card.color]?.contains(card) ?? false);

  bool put(CardModel card) {
    if (contains(card)) return false;
    if (!_cards.containsKey(card.color)) _cards[card.color] = [];
    _cards[card.color]!.add(card);
    _isAccepting = false;
    _lastAccepted = card;
    notifyListeners();
    return true;
  }

  void startTurn() {
    _isAccepting = true;
    _lastAccepted = null;
  }

  void endTurn() {
    _isAccepting = false;
    _lastAccepted = null;
    notifyListeners();
  }

  CardModel? undo() {
    if (_lastAccepted == null) return null;
    _cards[_lastAccepted!.color]!.remove(_lastAccepted);
    if (_cards[_lastAccepted!.color]!.isEmpty) {
      _cards.remove(_lastAccepted!.color);
    }
    final retval = _lastAccepted;
    _lastAccepted = null;
    notifyListeners();
    return retval;
  }
}
