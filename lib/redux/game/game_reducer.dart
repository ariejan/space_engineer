import 'package:redux/redux.dart';

import 'game_actions.dart';
import 'game_state.dart';
import 'cooldown.dart';

import 'package:space_engineer/settings.dart' as settings;

final gameStateReducer = combineReducers<GameState>([
  TypedReducer<GameState, MineAsteroidsAction>(_mineAsteroids),
  TypedReducer<GameState, TickAction>(_tick),
]);

// _tick is called every 1s and should progress timers, etc.
GameState _tick(GameState state, TickAction action) {
  Map<String, Cooldown> newCooldowns = Map<String, Cooldown>();

  state.cooldowns.forEach((identifier, cooldown) {
    int newTimeLeft = cooldown.timeLeft - action.delta;

    if (newTimeLeft > 0) {
      newCooldowns.putIfAbsent(identifier, () => cooldown.copyWith(
        timeLeft: newTimeLeft,
      ));
    } else {
      // Cooldown has expires; for now just ignore it
    }
  });

  return state.copyWith(
    cooldowns: newCooldowns,
  );
}

GameState _mineAsteroids(GameState state, MineAsteroidsAction action) {
  Map<String, Cooldown> cds = Map.of(state.cooldowns);

  cds.putIfAbsent('mining', () => Cooldown(
    duration: settings.miningCooldown,
    timeLeft: settings.miningCooldown,
  ));

  return state.copyWith(
    resources: state.resources + (10 * state.numberOfAsteroids),
    cooldowns: cds,
  );
}