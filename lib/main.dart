import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_numbers_app/game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    return MaterialApp(
      title: 'Learn Numbers App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: SafeArea(
        child: Scaffold(
          body: Game(),
        ),
      ),
    );
  }
}
