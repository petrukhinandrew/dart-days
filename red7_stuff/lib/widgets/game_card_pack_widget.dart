import 'package:flutter/material.dart';
import 'package:red7_stuff/widgets/game_card_widget.dart';
import 'package:red7_stuff/utils/statics.dart';
import 'package:red7_stuff/domain/game_model.dart';

class CardPackStackView extends StatelessWidget {
  final List<CardModel> cards;
  const CardPackStackView(this.cards, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * packWidthFactor,
        height: MediaQuery.of(context).size.height * packHeightFactor,
        child: _buildContent(context));
  }

  Widget _buildContent(BuildContext context) => Stack(
        children: List.generate(
          cards.length,
          (index) => Align(
            alignment: Alignment(
              cards.length > 1 ? -1.0 + (index / (cards.length - 1)) * 2.0 : 0,
              0,
            ),
            child: GameCardWidget(cards[index]),
          ),
        ),
      );
}
