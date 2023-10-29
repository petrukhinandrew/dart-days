import 'package:flutter/material.dart';
import 'package:red7_stuff/widgets/game_card_pack_widget.dart';
import 'package:red7_stuff/domain/game_model.dart';

abstract class PaletteContentView extends StatelessWidget {
  final AxisDirection? vertical;
  final AxisDirection? horizontal;
  final PaletteModel model;
  const PaletteContentView(
      {required this.model, this.vertical, this.horizontal, super.key});
}

class TwoPlayerPaletteContentView extends PaletteContentView {
  const TwoPlayerPaletteContentView({required super.model, super.key});
  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: model.cards.map((e) => CardPackStackView(e)).toList(),
        ),
      );
}

class FourPlayerPaletteContentView extends PaletteContentView {
  const FourPlayerPaletteContentView(
      {required super.model,
      required super.vertical,
      required super.horizontal,
      super.key});

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: model,
        builder: (c, w) => SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Wrap(
              alignment: horizontal == AxisDirection.left
                  ? WrapAlignment.start
                  : WrapAlignment.end,
              verticalDirection: vertical == AxisDirection.up
                  ? VerticalDirection.down
                  : VerticalDirection.up,
              children: model.cards.map((e) => CardPackStackView(e)).toList()),
        ),
      );
}
