import 'package:meta/meta.dart';

@immutable
class GameState {

  final int numberOfAsteroids;
  final int resources;
  final int miningCooldown;
  final double miningCooldownFraction;
  final int level;

  GameState({
    this.numberOfAsteroids,
    this.resources,
    this.miningCooldown,
    this.miningCooldownFraction,
    this.level,
  });

  GameState copyWith({
    int numberOfAsteroids,
    int resources,
    int miningCooldown,
    double miningCooldownFraction,
    int level,
  }) {
    return GameState(
      numberOfAsteroids: numberOfAsteroids ?? this.numberOfAsteroids,
      resources: resources ?? this.resources,
      miningCooldown: miningCooldown ?? this.miningCooldown,
      miningCooldownFraction: miningCooldownFraction ?? this.miningCooldownFraction,
      level: level ?? this.level,
    );
  }

  factory GameState.initial() {
    return GameState(
      numberOfAsteroids: 1,
      resources: 0,
      miningCooldown: 0,
      miningCooldownFraction: 0.0,
      level: 1,
    );
  }
}