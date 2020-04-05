import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:space_engineer/redux/app/app_state.dart';
import 'package:space_engineer/redux/store.dart';

import 'ui/home/home.dart';

void main() async {
  var store = await createStore();
  runApp(AppWidget(store));
}

class AppWidget extends StatefulWidget {
  final Store<AppState> store;

  AppWidget(this.store);

  @override
  _AppWidget createState() => _AppWidget();
}

class _AppWidget extends State<AppWidget> {
  ThemeData _theme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      accentColor: Colors.amberAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: 'Space Engineer',
        theme: _theme(),
        home: Home(),
      )
    );
  }
}
