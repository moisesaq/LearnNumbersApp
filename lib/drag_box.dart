import 'package:flutter/material.dart';
import 'package:learn_numbers_app/box.dart';
import 'package:audioplayers/audio_cache.dart';

class DragBox extends Box {
  DragBox({
    @required initPosition,
    @required number,
  }) : super(initPosition: initPosition, number: number);

  @override
  State<StatefulWidget> createState() => _DragBoxState();
}

class _DragBoxState extends State<DragBox> with TickerProviderStateMixin {
  Offset _origin;
  Offset _position;
  Color _color;

  AnimationController _controller;
  Animation<Offset> offsetTween;

  AudioCache audioCache = AudioCache();

  @override
  void initState() {
    super.initState();
    setUpPositions();
    _color = widget.number.color;
    setUpAnimation();
  }

  void setUpPositions() {
    _origin = widget.initPosition;
    _position = widget.initPosition;
  }

  void setUpAnimation() {
    _controller = AnimationController(
        duration: const Duration(seconds: 1), vsync: this);
    offsetTween = Tween<Offset>(begin: _position, end: _origin)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Positioned(
            left: offsetTween.value.dx,
            top: offsetTween.value.dy,
            child: buildDraggable(),
          );
        });
  }

  Widget buildDraggable() {
    return Draggable(
      data: widget.number,
      child: widget.buildBox(size: 100.0, numberSize: 20, boxColor: _color),
      onDraggableCanceled: (velocity, offset) {
        updatePosition(offset);
      },
      onDragCompleted: () {
        updateColor();
      },
      feedback: widget.buildBox(size: 120.0, numberSize: 18, boxColor: _color.withOpacity(0.5)),
    );
  }

  void updatePosition(Offset position) {
    setState(() {
      _position = position;
    });
    setUpAnimation();
    _controller.forward();
    playAudioFailed();
  }

  void updateColor() {
    setState(() {
      _color = _color.withOpacity(0.2);
    });
    playAudioSuccessful();
  }

  void playAudioSuccessful() {
    audioCache.play('homero-woohoo.mp3');
  }

  void playAudioFailed() {
    audioCache.play('homero-ouch.mp3');
  }
}
