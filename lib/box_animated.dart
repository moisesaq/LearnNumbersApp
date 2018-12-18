import 'package:flutter/material.dart';

class BoxAnimated extends StatefulWidget {
  final String label;
  final Color color;

  BoxAnimated({@required this.label, @required this.color});

  @override
  State<StatefulWidget> createState() => _BoxAnimatedState();
}

class _BoxAnimatedState extends State<BoxAnimated>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> transitionTween;
  Animation<BorderRadius> borderRadius;

  @override
  void initState() {
    super.initState();
    setUpAnimation();
  }

  void setUpAnimation() {
    _controller =
        AnimationController(duration: const Duration(milliseconds: 1500), vsync: this)
          ..addStatusListener((status) {});

    transitionTween = Tween<double>(
      begin: 50.0,
      end: 150.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticInOut,
      ),
    );
    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(75.0),
      end: BorderRadius.circular(5.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticInOut,
      ),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        print("Animation started");
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return buildBoxAnimated(size: 150.0, numberSize: 15.0);
  }

  Widget buildBoxAnimated(
      {@required double size, @required double numberSize}) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                  child: Container(
                width: 150.0,
                height: 150.0,
                color: Colors.black12,
              )),
              Center(
                child: Container(
                  width: transitionTween.value,
                  height: transitionTween.value,
                  decoration: buildDecoration(),
                  child: Center(
                    child: Text(
                      widget.label,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: numberSize),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  BoxDecoration buildDecoration() {
    return BoxDecoration(
        color: widget.color,
        borderRadius:
            borderRadius.value //BorderRadius.all(Radius.circular(5.0)),
        );
  }
}
