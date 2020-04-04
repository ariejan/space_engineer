import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() => runApp(SpaceEngineerApp());

class SpaceEngineerApp extends StatelessWidget {

  ThemeData _theme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      accentColor: Colors.amberAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space Engineer',
      theme: _theme(),
      home: HomeScreen(),
    );
  }
}
