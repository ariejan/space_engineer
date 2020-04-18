import 'package:redux/redux.dart';
import 'package:space_engineer/redux/app/app_state.dart';
import 'package:space_engineer/redux/game/cooldown.dart';
import 'package:space_engineer/redux/game/game_actions.dart';

class MiningViewModel {

  final int numberOfAsteroids;
  final Cooldown miningCooldown;
  final Function() mineAsteroids;

  MiningViewModel({
    this.numberOfAsteroids,
    this.miningCooldown,
    this.mineAsteroids,
  });

  static MiningViewModel fromStore(Store<AppState> store) {
    return MiningViewModel(
      numberOfAsteroids: store.state.gameState.numberOfAsteroids,
      miningCooldown: store.state.gameState.cooldowns['mining'],
      mineAsteroids: () => store.dispatch(MineAsteroidsAction()),
    );
  }
}