part of game_model;

class HandModel {
  final List<CardModel> _cards;

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  List<CardModel> get cards => _cards;

  HandModel(this._cards);

  bool remove(CardModel card) {
    return _cards.remove(card);
  }

  void put(CardModel card) {
    _cards.add(card);
  }

  void putAll(List<CardModel> newCards) {
    _cards.addAll(newCards);
  }

  void startTurn() {
    _isPlaying = true;
  }

  void endTurn() {
    _isPlaying = false;
  }
}
