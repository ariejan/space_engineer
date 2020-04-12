import 'package:redux/redux.dart';
import 'package:space_engineer/redux/app/app_state.dart';
import 'package:space_engineer/redux/game/cooldown.dart';
import 'package:space_engineer/redux/game/game_actions.dart';

class HomeViewModel {

  final int numberOfAsteroids;
  final int resources;
  final Cooldown miningCooldown;
  final int level;

  final Function() mineAsteroids;

  HomeViewModel({
    this.numberOfAsteroids,
    this.resources,
    this.miningCooldown,
    this.level,
    this.mineAsteroids,
  });

  static HomeViewModel fromStore(Store<AppState> store) {
    return HomeViewModel(
      numberOfAsteroids: store.state.gameState.numberOfAsteroids,
      resources: store.state.gameState.resources,
      miningCooldown: store.state.gameState.cooldowns['mining'],
      level: store.state.gameState.level,
      mineAsteroids: () => store.dispatch(MineAsteroidsAction()),
    );
  }
}