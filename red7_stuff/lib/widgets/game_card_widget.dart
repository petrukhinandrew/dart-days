import 'package:flutter/material.dart';
import 'package:red7_stuff/domain/game_model.dart';
import 'package:red7_stuff/utils/statics.dart';

class GameCardWidget extends StatelessWidget {
  final CardModel model;

  GameCardWidget(this.model, {super.key});

  final ShapeBorder _shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: const BorderSide(color: GameCardColor.BLACK, width: 1));

  @override
  Widget build(BuildContext context) =>
      model.isBlank ? _buildBackSide(context) : _buildFrontSide(context);

  Widget _buildFrontSide(BuildContext context) {
    return AspectRatio(
      aspectRatio: cardAspectRatio,
      child: Card(
        elevation: 3.0,
        color: model.color,
        shape: _shape,
        clipBehavior: Clip.hardEdge,
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildBackSide(BuildContext context) {
    final double cWidth = MediaQuery.of(context).size.width;
    final double cardWidth = cWidth * cardWidthFactor;
    final double cardHeight = cWidth * cardHeightFactor;
    final t = AspectRatio(
      aspectRatio: cardAspectRatio,
      child: Card(
        elevation: 3.0,
        color: Colors.black54,
        shape: _shape,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
            width: cardWidth,
            height: cardHeight,
            child: const Center(
                child: Text(
              "RED7",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ))),
      ),
    );
    return t;
  }

  Widget _buildContent(BuildContext context) {
    final double cWidth = MediaQuery.of(context).size.width;
    final double cardWidth = cWidth * cardWidthFactor;
    final double cardHeight = cWidth * cardHeightFactor;
    final double labelBoxSide = cardWidth * 0.6;

    final double labelBoxPadding = cardWidth * 0.03;

    Widget label = SizedBox(
        width: labelBoxSide,
        height: labelBoxSide,
        child: Text(model.value.toString()));

    return Stack(
      children: [
        Align(
          alignment: const Alignment(0, 0),
          child: SizedBox(
            width: cardWidth,
            height: cardHeight,
          ),
        ),
        Positioned(top: labelBoxPadding, left: labelBoxPadding, child: label)
      ],
    );
  }
}
