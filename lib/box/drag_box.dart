import 'package:flutter/material.dart';
import 'package:learn_numbers_app/box/box.dart';
import 'package:learn_numbers_app/animation/drag_animation.dart';

class DragBox extends Box {
  DragBox({
    @required initPosition,
    @required number,
  }) : super(initPosition: initPosition, number: number);

  @override
  State<StatefulWidget> createState() => _DragBoxState();
}

class _DragBoxState extends State<DragBox> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DragAnimation(box: widget);
  }
}
