import 'package:flutter/material.dart';
import 'package:red7_stuff/widgets/palette_content_view.dart';
import 'package:red7_stuff/domain/game_model.dart';
import 'package:red7_stuff/utils/statics.dart';

class ActivePaletteView extends StatefulWidget {
  final PaletteContentView content;
  const ActivePaletteView({required this.content, super.key});

  @override
  State<ActivePaletteView> createState() => _ActivePaletteViewState();
}

class _ActivePaletteViewState extends State<ActivePaletteView> {
  late Color _borderColor =
      widget.content.model.lastAccepted?.color ?? GameResponseColor.INACTIVE;
  Color _backColor = GameResponseColor.INACTIVE;

  @override
  void initState() {
    super.initState();
    widget.content.model.addListener(() {
      setState(() {
        _borderColor = widget.content.model.lastAccepted?.color ??
            GameResponseColor.INACTIVE;
      });
    });
  }

  @override
  Widget build(BuildContext context) => DragTarget<CardModel>(
      onWillAccept: (data) {
        final response = widget.content.model.isAccepting;
        _backColor =
            response ? GameResponseColor.ACCEPT : GameResponseColor.REJECT;
        return response;
      },
      onLeave: (data) {
        _backColor = GameResponseColor.INACTIVE;
      },
      onAccept: (data) {
        _backColor = GameResponseColor.INACTIVE;
        widget.content.model.put(data);
      },
      builder: (context, candidateData, rejectedData) => Container(
            decoration: BoxDecoration(
                color: _backColor,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(color: _borderColor, width: 0.0)),
            child: widget.content,
          ));
}
