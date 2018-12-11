import 'package:flutter/material.dart';
import 'package:learn_numbers_app/number.dart';

class DragBox extends StatefulWidget {
  final Offset initPosition;
  final Number number;

  DragBox({
    @required this.initPosition,
    @required this.number,
  });

  @override
  State<StatefulWidget> createState() => _DragBoxState();
}

class _DragBoxState extends State<DragBox> {
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
      child: Draggable(
        data: widget.number,
        child: buildBox(size: 100.0, numberSize: 20),
        /*onDraggableCanceled: (velocity, offset) {
          updatePosition(offset);
        },*/
        onDragCompleted: () {
          print("drag completed ${widget.number.value}");
        },
        onDragEnd: (DraggableDetails details) {
          print("Details: ${details.offset} - ${details.wasAccepted}");
          if (!details.wasAccepted) {
            goBackLastPosition();
          }
        },
        feedback: buildBox(size: 120.0, numberSize: 18, colorOpacity: 0.5),
      ),
    );
  }

  Widget buildBox(
      {@required double size,
        @required double numberSize,
        double colorOpacity = 1.0}) {
    return Container(
      width: size,
      height: size,
      color: widget.number.color.withOpacity(colorOpacity),
      child: Center(
        child: Text(
          widget.number.value.toString(),
          style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: numberSize),
        ),
      ),
    );
  }

  void updatePosition(Offset position) {
    setState(() {
      _position = position;
      print("Update position $_position");
    });
  }

  void goBackLastPosition() {
    final pos = _position;
    setState(() {
      print("Go back $pos - $_position");
      _position = pos;
    });
  }
}