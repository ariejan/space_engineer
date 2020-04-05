import 'dart:async';
import 'package:redux_logging/redux_logging.dart';

import 'app/app_state.dart';
import 'app/app_reducers.dart';
import 'package:redux/redux.dart';

Future<Store<AppState>> createStore() async {
  return Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      new LoggingMiddleware.printer(),
    ]
  );
}