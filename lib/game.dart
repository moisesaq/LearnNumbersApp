import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_numbers_app/box/drag_box.dart';
import 'package:learn_numbers_app/box/target_box.dart';
import 'package:learn_numbers_app/model/number.dart';
import 'package:learn_numbers_app/util/random_factory.dart';

class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GameState();
}

class _GameState extends State<Game> {
  Color caughtColor = Colors.grey;
  int numberOfCorrect = 0;
  int numberOfBoxes;

  @override
  void initState() {
    super.initState();
    numberOfBoxes = RandomFactory.getRandomNumberOfBoxes();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: generateRandomInputs(),
    );
  }

  List<Widget> generateRandomInputs() {
    final List<double> positions = RandomFactory.generateXPositions(context, numberOfBoxes);

    final List<Widget> dragBoxes = [];
    final List<Widget> targetBoxes = [];
    for (int i = 0; i < numberOfBoxes; i++) {
      final word = RandomFactory.getRandomWord();
      final color = RandomFactory.getRandomColor();
      final num = Number(word: word, color: color);
      final xPosition = positions.removeLast();

      dragBoxes.add(DragBox(initPosition: Offset(xPosition, 20.0), number: num));
      targetBoxes.add(TargetBox(initPosition: Offset(xPosition, 220.0), number: num, success: success));
    }

    return List.from(dragBoxes)..addAll(targetBoxes);
  }

  void success() {
    numberOfCorrect++;
    print(numberOfCorrect);
    if (numberOfCorrect == numberOfBoxes) {
      setState(() {
        numberOfCorrect = 0;
        numberOfBoxes = Random().nextInt(4) + 2;
      });
    }
  }
}
