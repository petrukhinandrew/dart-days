import 'package:flutter/material.dart';
import 'package:red7_stuff/utils/statics.dart';
import 'package:red7_stuff/widgets/game_card_widget.dart';
import 'package:red7_stuff/domain/game_model.dart';

Widget buildPlayerHand(HandModel model, void Function() undo,
        void Function() startTurn, void Function() endTurn) =>
    _GamePlayerHandSampleWidget(model, undo, startTurn, endTurn);

class _GamePlayerHandSampleWidget extends StatefulWidget {
  final HandModel model;
  final void Function() undo;
  final void Function() startTurn;
  final void Function() endTurn;
  const _GamePlayerHandSampleWidget(
      this.model, this.undo, this.startTurn, this.endTurn,
      {super.key});

  @override
  State<_GamePlayerHandSampleWidget> createState() =>
      _GamePlayerHandSampleWidgetState();
}

class _GamePlayerHandSampleWidgetState
    extends State<_GamePlayerHandSampleWidget> {
  CardModel? _curUsedItem;

  Draggable<CardModel> _asDraggable(CardModel target) => Draggable(
        onDragStarted: () {
          _curUsedItem = target;
        },
        onDraggableCanceled: (v, o) {
          _curUsedItem = null;
        },
        onDragCompleted: () {
          setState(() {
            widget.model.cards.remove(_curUsedItem);
            _curUsedItem = null;
          });
        },
        childWhenDragging: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const RadialGradient(
                center: Alignment.topLeft,
                radius: 3.0,
                colors: <Color>[Colors.white54, Colors.white10],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            child: GameCardWidget(target)),
        feedback: SizedBox(
            width: 128.0 * cardAspectRatio,
            height: 150.0,
            child: GameCardWidget(target)),
        data: target,
        child: GameCardWidget(target),
      );

  @override
  Widget build(BuildContext context) {
    final double wrapWidth = MediaQuery.of(context).size.width * 0.8;
    final double wrapHeight = MediaQuery.of(context).size.height * 0.2;
    return SizedBox(
        width: wrapWidth,
        height: wrapHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                BackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      setState(() {
                        widget.startTurn();
                      });
                    }),
                IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () {
                    setState(() {
                      widget.endTurn();
                    });
                  },
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        widget.undo();
                      });
                    },
                    icon: const Icon(Icons.cancel)),
              ] +
              widget.model.cards.map((e) => _asDraggable(e)).toList(),
        ));
  }
}
