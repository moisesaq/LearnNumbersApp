import 'package:flutter/material.dart';
import 'package:learn_numbers_app/number.dart';

abstract class Box extends StatefulWidget {
  final Offset initPosition;
  final Number number;

  Box({
    @required this.initPosition,
    @required this.number,
  });

  Widget buildBox({
    @required double size,
    @required double numberSize,
    Color boxColor,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: boxColor == null ? number.color : boxColor,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Center(
        child: Text(
          number.value.toString(),
          style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: numberSize),
        ),
      ),
    );
  }
}
