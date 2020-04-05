import 'package:meta/meta.dart';

@immutable
class GameState {

  final int numberOfAsteroids;
  final int resources;
  final int miningCooldown;

  GameState({
    this.numberOfAsteroids,
    this.resources,
    this.miningCooldown,
  });

  GameState copyWith({
    int numberOfAsteroids,
    int resources,
    int miningCooldown,
  }) {
    return GameState(
      numberOfAsteroids: numberOfAsteroids ?? this.numberOfAsteroids,
      resources: resources ?? this.resources,
      miningCooldown: miningCooldown ?? this.miningCooldown,
    );
  }

  factory GameState.initial() {
    return GameState(
      numberOfAsteroids: 1,
      resources: 0,
      miningCooldown: 0,
    );
  }
}