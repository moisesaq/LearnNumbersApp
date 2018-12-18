import 'package:flutter/material.dart';
import 'package:learn_numbers_app/animation/target_animation.dart';
import 'package:learn_numbers_app/box/box.dart';
import 'package:learn_numbers_app/model/number.dart';
import 'package:learn_numbers_app/util/constants.dart';

class TargetBox extends Box {
  final Function success;

  TargetBox({
    @required initPosition,
    @required number,
    @required this.success,
  }) : super(initPosition: initPosition, number: number);

  @override
  State<StatefulWidget> createState() => _TargetBoxState();
}

class _TargetBoxState extends State<TargetBox> with SingleTickerProviderStateMixin {
  Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = Colors.grey.shade300;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.initPosition.dx,
      top: widget.initPosition.dy,
      child: DragTarget(
        onWillAccept: (number) => number.word == widget.number.word,
        onAccept: (Number number) {
          _selectedColor = number.color;
          widget.success();
        },
        builder: (BuildContext context, List<dynamic> accepted, List<dynamic> rejected) {
          return accepted.isEmpty
              ? TargetAnimation(label: widget.number.word, color: _selectedColor)
              : widget.buildBox(size: TARGET_BOX_SIZE_COMPLETE, fontSize: FONT_SIZE_FEEDBACK, boxColor: _selectedColor);
        },
      ),
    );
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _selectedColor = Colors.grey.shade300;
  }
}
