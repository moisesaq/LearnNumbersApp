
import 'package:flutter/material.dart';

class Number {
  final int value;
  final Color color;
  final double boxSize;
  final double numberSize;

  Number({this.value, this.color, this.boxSize = 150, this.numberSize = 20});

  double get increasedBoxSize => boxSize * 1.1;

  double get smallNumberSize => numberSize * 0.9;
}