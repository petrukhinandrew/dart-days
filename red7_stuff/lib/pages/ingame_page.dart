import 'package:flutter/material.dart';
import 'package:red7_stuff/domain/sample_models.dart';
import 'package:red7_stuff/domain/game_model.dart';
import 'package:red7_stuff/widgets/game_player_hand_widget.dart';
import 'package:red7_stuff/widgets/game_table_widget.dart';

class InGamePage extends StatelessWidget {
  final int numOfPlayers;
  late final GameModel model = numOfPlayers == 4 ? testModel4 : testModel2;
  InGamePage(this.numOfPlayers, {super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildGameTable(numOfPlayers, model),
                buildPlayerHand(
                    model.hand, model.undo, model.startTurn, model.endTurn),
              ]),
        ),
      );
}
