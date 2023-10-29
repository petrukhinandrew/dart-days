import 'package:flutter/material.dart';

import 'package:red7_stuff/widgets/palette_content_view.dart';
import 'package:red7_stuff/widgets/active_palette_view.dart';
import 'package:red7_stuff/widgets/game_decks_widget.dart';

import 'package:red7_stuff/domain/game_model.dart';

Widget buildGameTable(int numOfPlayers, GameModel model) {
  switch (numOfPlayers) {
    case < 1 || > 4:
      throw Exception("invalid number of players");
    case 2:
      return _TwoPlayersTableView(model);
    case 4:
      return _FourPlayersTableView(model);
    default:
      throw Exception("Not yet implemented");
  }
}

class _FourPlayersTableView extends StatelessWidget {
  final GameModel model;
  const _FourPlayersTableView(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FourPlayerPaletteContentView(
                  model: model.palettes[0],
                  horizontal: AxisDirection.left,
                  vertical: AxisDirection.up,
                ),
                FourPlayerPaletteContentView(
                  model: model.palettes[1],
                  horizontal: AxisDirection.right,
                  vertical: AxisDirection.up,
                ),
              ]),
          Row(children: [
            FourPlayerPaletteContentView(
              model: model.palettes[2],
              horizontal: AxisDirection.left,
              vertical: AxisDirection.down,
            ),
            ActivePaletteView(
                content: FourPlayerPaletteContentView(
              model: model.palettes[3],
              horizontal: AxisDirection.right,
              vertical: AxisDirection.down,
            )),
          ]),
        ],
      ),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          left: MediaQuery.of(context).size.width * 0.375,
          child: DecksView(model.decks))
    ]);
  }
}

class _TwoPlayersTableView extends StatelessWidget {
  final GameModel model;
  const _TwoPlayersTableView(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TwoPlayerPaletteContentView(model: model.palettes[0]),
        DecksView(model.decks),
        ActivePaletteView(
            content: TwoPlayerPaletteContentView(model: model.palettes[1])),
      ],
    );
  }
}
