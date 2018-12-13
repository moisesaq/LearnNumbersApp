import 'package:flutter/material.dart';
import 'package:learn_numbers_app/box.dart';
import 'package:learn_numbers_app/number.dart';
import 'package:learn_numbers_app/box_animated.dart';

class TargetBox extends Box {
  TargetBox({
    @required initPosition,
    @required number,
  }) : super(initPosition: initPosition, number: number);

  @override
  State<StatefulWidget> createState() => _TargetBoxState();
}

class _TargetBoxState extends State<TargetBox>
    with SingleTickerProviderStateMixin {

  Color selectedColor = Colors.grey.shade300;
  Offset _position;

  @override
  void initState() {
    super.initState();
    _position = widget.initPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _position.dx,
      top: _position.dy,
      child: DragTarget(
        onWillAccept: (number) {
          return number.value == widget.number.value;
        },
        onAccept: (Number number) {
          selectedColor = number.color;
        },
        builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
        ) {
          //final color = accepted.isEmpty ? caughtColor : Colors.grey.shade300;
          return accepted.isEmpty
              ? BoxAnimated(
                  label: widget.number.value.toString(),
                  color: selectedColor,
                )
              : widget.buildBox(
                  size: 150.0,
                  numberSize: 15.0,
                  boxColor: Colors.grey.shade300,
                );
        },
      ),
    );
  }
}
