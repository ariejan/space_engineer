import 'package:meta/meta.dart';
import 'cooldown.dart';

@immutable
class GameState {

  final int numberOfAsteroids;
  final int resources;
  final int level;

  final Map<String, Cooldown> cooldowns;

  GameState({
    this.numberOfAsteroids,
    this.resources,
    this.level,
    this.cooldowns,
  });

  GameState copyWith({
    int numberOfAsteroids,
    int resources,
    int level,
    Map<String, Cooldown> cooldowns,
  }) {
    return GameState(
      numberOfAsteroids: numberOfAsteroids ?? this.numberOfAsteroids,
      resources: resources ?? this.resources,
      level: level ?? this.level,
      cooldowns: cooldowns ?? this.cooldowns,
    );
  }

  factory GameState.initial() {
    return GameState(
      numberOfAsteroids: 1,
      resources: 0,
      level: 1,
      cooldowns: Map<String, Cooldown>(),
    );
  }
}