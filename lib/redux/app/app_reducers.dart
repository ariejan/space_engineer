import 'package:space_engineer/redux/app/app_state.dart';
import 'package:space_engineer/redux/game/game_reducer.dart';


AppState appReducer(AppState state, dynamic action) =>
    new AppState(
      gameState: gameStateReducer(state.gameState, action),
    );