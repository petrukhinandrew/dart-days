part of game_model;

class DecksModel extends ChangeNotifier {
  CardModel _canvas;
  CardModel get canvas => _canvas;

  int _unplayedCardsLeft;
  int get unplayedCardsLeft => _unplayedCardsLeft;

  bool _isAccepting = false;
  bool get isAccepting => _isAccepting;

  CardModel? _prevPlayed;
  CardModel? get prevPlayed => _prevPlayed;

  DecksModel(this._canvas, this._unplayedCardsLeft);

  void put(CardModel card) {
    _prevPlayed = _canvas;
    _canvas = card;
    _isAccepting = false;
  }

  void startTurn() {
    _isAccepting = true;
    _prevPlayed = null;
  }

  void endTurn() {
    _isAccepting = false;
    _prevPlayed = null;
    notifyListeners();
  }

  CardModel? undo() {
    if (_prevPlayed == null) return null;
    final retval = _canvas;
    _canvas = _prevPlayed!;
    _prevPlayed = null;
    notifyListeners();
    return retval;
  }
}
