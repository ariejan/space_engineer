import 'package:redux/redux.dart';

import 'game_actions.dart';
import 'game_state.dart';

import 'package:space_engineer/settings.dart' as settings;

final gameStateReducer = combineReducers<GameState>([
  TypedReducer<GameState, MineAsteroidsAction>(_mineAsteroids),
  TypedReducer<GameState, TickAction>(_tick),
]);

// _tick is called every 1s and should progress timers, etc.
GameState _tick(GameState state, TickAction action) {
  var miningCooldown = state.miningCooldown - action.delta;
  if (miningCooldown < 0) {
    miningCooldown = 0;
  }

  return state.copyWith(
    miningCooldown: miningCooldown,
  );
}

GameState _mineAsteroids(GameState state, MineAsteroidsAction action) {
  return state.copyWith(
    resources: state.resources + (10 * state.numberOfAsteroids),
    miningCooldown: settings.miningCooldown,
  );
}