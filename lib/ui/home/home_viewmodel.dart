import 'package:redux/redux.dart';
import 'package:space_engineer/redux/app/app_state.dart';
import 'package:space_engineer/redux/game/game_actions.dart';

class HomeViewModel {

  final int numberOfAsteroids;
  final int resources;
  final bool miningOnCooldown;
  final double miningCooldownFraction;

  final Function() mineAsteroids;

  HomeViewModel({
    this.numberOfAsteroids,
    this.resources,
    this.miningOnCooldown,
    this.miningCooldownFraction,
    this.mineAsteroids,
  });

  static HomeViewModel fromStore(Store<AppState> store) =>
      new HomeViewModel(
        numberOfAsteroids: store.state.gameState.numberOfAsteroids,
        resources: store.state.gameState.resources,
        miningOnCooldown: store.state.gameState.miningCooldown > 0,
        miningCooldownFraction: store.state.gameState.miningCooldown / 1500.0,
        mineAsteroids: () => store.dispatch(MineAsteroidsAction()),
      );
}