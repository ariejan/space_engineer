import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:space_engineer/models/models.dart';
import 'package:space_engineer/reducers/app_reducers.dart';
import 'home_screen.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(resources: 0, asteroids: 1),
  );

  runApp(StoreProvider(store: store, child: SpaceEngineerApp()));
}

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
