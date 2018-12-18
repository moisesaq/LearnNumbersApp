import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_numbers_app/util/constants.dart';

class RandomFactory {
  static Color getRandomColor() {
    final colors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.grey,
      Colors.blueGrey,
      Colors.brown,
      Colors.purple,
      Colors.amberAccent,
      Colors.green,
      Colors.orange
    ];
    colors.shuffle();
    return colors.removeLast();
  }

  static String getRandomWord() {
    final words = ['Cama', 'Mesa', 'Silla', 'Yerba', 'Vaso', 'Pan', 'Sol', 'Sal', 'Dado', 'Mate'];
    words.shuffle();
    return words.removeLast();
  }

  static List<double> generateXPositions(BuildContext context, int numberOfBoxes) {
    final width = MediaQuery.of(context).size.width;
    final distance = width / numberOfBoxes;

    final List<double> results = [];
    for (int i = 0; i < numberOfBoxes; i++) {
      results.add(distance * (i + 1 / 3));
    }
    results.shuffle();
    return results;
  }

  static int getRandomNumberOfBoxes() {
    return Random().nextInt(MAX_NUMBER_OF_BOXES - 2) + 2;
  }
}
