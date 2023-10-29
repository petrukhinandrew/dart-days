import 'package:flutter/material.dart';
import 'package:red7_stuff/utils/statics.dart';
import 'package:red7_stuff/widgets/game_card_widget.dart';
import 'package:red7_stuff/domain/game_model.dart';

class DecksView extends StatefulWidget {
  final DecksModel model;
  const DecksView(this.model, {super.key});

  @override
  State<DecksView> createState() => _DecksViewState();
}

class _DecksViewState extends State<DecksView> {
  Color get _borderColor => widget.model.prevPlayed == null
      ? GameResponseColor.DECKS_BORDER_INACTIVE
      : widget.model.canvas.color;
  Color _backColor = GameResponseColor.DECKS_BACK_INACTIVE;

  void _acceptPlayedCard(CardModel m) {
    widget.model.put(m);
  }

  Widget _content(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.model,
      builder: (ctx, wgt) => Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
              color: _backColor,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              border: Border.all(color: _borderColor, width: 2.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GameCardWidget(widget.model.canvas),
              GameCardWidget(CardModel.blank()),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<CardModel>(
        onAccept: (data) {
          _backColor = GameResponseColor.DECKS_BACK_INACTIVE;
          _acceptPlayedCard(data);
        },
        onLeave: (data) {
          _backColor = GameResponseColor.DECKS_BACK_INACTIVE;
        },
        onWillAccept: (data) {
          final response = widget.model.isAccepting;
          _backColor =
              response ? GameResponseColor.ACCEPT : GameResponseColor.REJECT;
          return response;
        },
        builder: (c, a, r) => _content(context));
  }
}
