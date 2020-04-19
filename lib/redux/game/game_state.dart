import 'package:meta/meta.dart';

@immutable
class GameState {

  final int numberOfAsteroids;

  final int fuel;
  final int metal;
  final int carbon;

  final int level;
  final int turn;

  GameState({
    this.numberOfAsteroids,
    this.fuel,
    this.metal,
    this.carbon,
    this.level,
    this.turn,
  });

  GameState copyWith({
    int numberOfAsteroids,
    int fuel,
    int metal,
    int carbon,
    int level,
    int turn,
  }) {
    return GameState(
      numberOfAsteroids: numberOfAsteroids ?? this.numberOfAsteroids,
      fuel: fuel ?? this.fuel,
      metal: metal ?? this.metal,
      carbon: carbon ?? this.carbon,
      level: level ?? this.level,
      turn: turn ?? this.turn,
    );
  }

  factory GameState.initial() {
    return GameState(
      numberOfAsteroids: 1,
      fuel: 0,
      metal: 1000,
      carbon: 1000,
      level: 1,
      turn: 1,
    );
  }
}