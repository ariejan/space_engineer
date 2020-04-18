import 'package:redux/redux.dart';

import 'game_actions.dart';
import 'game_state.dart';

import 'package:space_engineer/settings.dart' as settings;

final gameStateReducer = combineReducers<GameState>([
  TypedReducer<GameState, MineAsteroidsAction>(_mineAsteroids),
  TypedReducer<GameState, TickAction>(_tick),
]);

GameState _tick(GameState state, TickAction action) {
  return state;
}

GameState _mineAsteroids(GameState state, MineAsteroidsAction action) {
  // TODO: Rewrite as turn-event
//  Map<String, Cooldown> cds = Map.of(state.cooldowns);
//
//  cds.putIfAbsent('mining', () => Cooldown(
//    duration: settings.miningCooldown,
//    timeLeft: settings.miningCooldown,
//  ));
//
//  return state.copyWith(
//    resources: state.resources + (10 * state.numberOfAsteroids),
//    cooldowns: cds,
//  );
}