import 'package:flutter/material.dart';
import 'package:learn_numbers_app/number.dart';

class TargetBox extends StatefulWidget {
  final Offset initPosition;
  final Number number;

  TargetBox({
    @required this.initPosition,
    @required this.number,
  });

  @override
  State<StatefulWidget> createState() => _TargetBoxState();
}

class _TargetBoxState extends State<TargetBox> {
  Color caughtColor = Colors.grey;
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
          caughtColor = number.color;
        },
        builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
        ) {
          return Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              color: accepted.isEmpty ? caughtColor : Colors.grey.shade200,
            ),
            child: Center(
              child: Text("Drag here!"),
            ),
          );
        },
      ),
    );
  }
}
