import 'package:flutter/material.dart';
import 'package:learn_numbers_app/drag_box.dart';
import 'package:learn_numbers_app/number.dart';
import 'package:learn_numbers_app/target_box.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Numbers App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color caughtColor = Colors.grey;

  final num1 = Number(1, Colors.deepOrange);
  final num2 = Number(2, Colors.blueAccent);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            DragBox(initPosition: Offset(20.0, 20.0), number: num1),
            DragBox(initPosition: Offset(220.0, 20.0), number: num2),
            TargetBox(initPosition: Offset(20.0, 300.0), number: num1),
            TargetBox(initPosition: Offset(220.0, 300.0), number: num2),
          ],
        ),
      ),
    );
  }
}
