import 'package:flutter/material.dart';
import 'package:learn_numbers_app/box/box.dart';
import 'package:learn_numbers_app/util/constants.dart';

class DragAnimation extends StatefulWidget {
  final Box box;

  DragAnimation({@required this.box});

  @override
  State<StatefulWidget> createState() => _DragAnimationState();
}

class _DragAnimationState extends State<DragAnimation> with TickerProviderStateMixin {
  Offset _position;
  Color _selectedColor;
  AnimationController _controller;
  Animation<Offset> _offsetTween;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _position = widget.box.initPosition;
    _selectedColor = widget.box.number.color;
    setUpAnimation();
  }

  void setUpAnimation() {
    _controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _offsetTween = Tween<Offset>(begin: _position, end: widget.box.initPosition)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Positioned(
            left: _offsetTween.value.dx,
            top: _offsetTween.value.dy,
            child: buildDraggable(),
          );
        });
  }

  Widget buildDraggable() {
    return Draggable(
      data: widget.box.number,
      child: widget.box.buildBox(size: DRAGGABLE_BOX_SIZE, fontSize: FONT_SIZE, boxColor: _selectedColor),
      onDraggableCanceled: (velocity, offset) => updatePosition(offset),
      onDragCompleted: () => setState(() => _selectedColor = _selectedColor.withOpacity(0.2)),
      feedback: widget.box.buildBox(
          size: DRAGGABLE_BOX_SIZE_FEEDBACK, fontSize: FONT_SIZE_FEEDBACK, boxColor: _selectedColor.withOpacity(0.5)),
    );
  }

  void updatePosition(Offset position) {
    setState(() => _position = position);
    setUpAnimation();
    _controller.forward();
  }
}
