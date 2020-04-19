import 'dart:async';
import 'package:redux_logging/redux_logging.dart';
import 'package:space_engineer/redux/game/game_actions.dart';

import 'app/app_state.dart';
import 'app/app_reducers.dart';
import 'package:redux/redux.dart';
import 'package:space_engineer/settings.dart' as settings;

Future<Store<AppState>> createStore() async {
  var store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      new LoggingMiddleware.printer(),
    ]
  );

  return store;
}