import 'package:redux/redux.dart';

import 'game_actions.dart';
import 'game_state.dart';

final gameStateReducer = combineReducers<GameState>([
  TypedReducer<GameState, MineAsteroidsAction>(_mineAsteroids),
]);

GameState _mineAsteroids(GameState state, MineAsteroidsAction action) {
  return state.copyWith(
    resources: state.resources + (10 * state.numberOfAsteroids),
  );
}