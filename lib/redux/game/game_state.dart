import 'package:meta/meta.dart';

@immutable
class GameState {

  final int numberOfAsteroids;
  final int resources;

  GameState({this.numberOfAsteroids, this.resources});

  GameState copyWith({
    int numberOfAsteroids,
    int resources,
  }) {
    return GameState(
      numberOfAsteroids: numberOfAsteroids ?? this.numberOfAsteroids,
      resources: resources ?? this.resources,
    );
  }

  factory GameState.initial() {
    return GameState(
      numberOfAsteroids: 1,
      resources: 0,
    );
  }
}