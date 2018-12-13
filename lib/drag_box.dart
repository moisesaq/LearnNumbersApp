import 'package:flutter/material.dart';
import 'package:learn_numbers_app/box.dart';

class DragBox extends Box {

  DragBox({
    @required initPosition,
    @required number,
  }): super(initPosition: initPosition, number: number);

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
        child: widget.buildBox(size: 100.0, numberSize: 20),
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
        feedback: widget.buildBox(size: 120.0, numberSize: 18, boxColor: widget.number.color.withOpacity(0.5)),
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