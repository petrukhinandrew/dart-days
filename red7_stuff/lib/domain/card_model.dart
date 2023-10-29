part of game_model;

class CardModel {
  final Color color;
  final int value;
  int get score => value * 10 + color.score;
  const CardModel(this.color, this.value);

  CardModel.copy(CardModel other)
      : color = other.color,
        value = other.value;

  CardModel.blank()
      : color = GameCardColor.BLACK,
        value = 0;

  bool get isBlank => value == 0 && color == GameCardColor.BLACK;

  @override
  bool operator ==(Object other) =>
      other is CardModel && color == other.color && value == other.value;

  @override
  int get hashCode => color.hashCode + value;

  @override
  String toString() => "${color.value.toString()} ${value.toString()}";
}
