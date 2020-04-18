import 'package:meta/meta.dart';

@immutable
class GameState {

  final int numberOfAsteroids;
  final int resources;
  final int level;

  GameState({
    this.numberOfAsteroids,
    this.resources,
    this.level,
  });

  GameState copyWith({
    int numberOfAsteroids,
    int resources,
    int level,
  }) {
    return GameState(
      numberOfAsteroids: numberOfAsteroids ?? this.numberOfAsteroids,
      resources: resources ?? this.resources,
      level: level ?? this.level,
    );
  }

  factory GameState.initial() {
    return GameState(
      numberOfAsteroids: 1,
      resources: 0,
      level: 1,
    );
  }
}