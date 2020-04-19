import 'package:redux/redux.dart';
import 'package:space_engineer/redux/app/app_state.dart';

class MiningViewModel {

  final int numberOfAsteroids;

  MiningViewModel({
    this.numberOfAsteroids,
  });

  static MiningViewModel fromStore(Store<AppState> store) {
    return MiningViewModel(
      numberOfAsteroids: store.state.gameState.numberOfAsteroids,
    );
  }
}