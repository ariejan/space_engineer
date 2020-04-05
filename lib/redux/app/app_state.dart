import 'package:meta/meta.dart';
import 'package:space_engineer/redux/game/game_state.dart';

@immutable
class AppState {

  final GameState gameState;

  AppState({
    @required this.gameState,
  });

  factory AppState.initial() {
    return AppState(
      gameState: GameState.initial(),
    );
  }

  AppState copyWith({
    GameState gameState,
  }) {
    return AppState(
      gameState: gameState ?? this.gameState,
    );
  }
}