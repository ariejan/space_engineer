import 'package:meta/meta.dart';

@immutable
class GameState {

  final int numberOfAsteroids;
  final int resources;
  final int level;
  final int turn;

  GameState({
    this.numberOfAsteroids,
    this.resources,
    this.level,
    this.turn,
  });

  GameState copyWith({
    int numberOfAsteroids,
    int resources,
    int level,
    int turn,
  }) {
    return GameState(
      numberOfAsteroids: numberOfAsteroids ?? this.numberOfAsteroids,
      resources: resources ?? this.resources,
      level: level ?? this.level,
      turn: turn ?? this.turn,
    );
  }

  factory GameState.initial() {
    return GameState(
      numberOfAsteroids: 1,
      resources: 0,
      level: 1,
      turn: 1,
    );
  }
}