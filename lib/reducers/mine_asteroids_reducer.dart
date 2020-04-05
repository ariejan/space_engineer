import 'package:redux/redux.dart';
import 'package:space_engineer/actions/actions.dart';

final mineAsteroidsReducer =
  TypedReducer<int, MineAsteroidsAction>(_mineAsteroidsActionReducer);

int _mineAsteroidsActionReducer(int state, MineAsteroidsAction action) {
  return state + (action.numberOfAsteroids * 10);
}