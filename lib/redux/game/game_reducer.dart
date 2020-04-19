import 'package:redux/redux.dart';

import 'game_actions.dart';
import 'game_state.dart';

import 'package:space_engineer/settings.dart' as settings;

final gameStateReducer = combineReducers<GameState>([
  TypedReducer<GameState, EndTurnAction>(_endTurn),
]);

GameState _endTurn(GameState state, EndTurnAction action) {
  print("Handling end-of-turn");

  return state.copyWith(
    resources: ((state.resources + 10) * 1.2).floor(),
    turn: state.turn + 1,
  );
}