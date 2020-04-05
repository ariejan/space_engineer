import 'package:space_engineer/models/models.dart';
import 'package:space_engineer/reducers/mine_asteroids_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    resources: mineAsteroidsReducer(state.resources, action),
    asteroids: state.asteroids
  );
}