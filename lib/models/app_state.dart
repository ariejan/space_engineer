import 'package:meta/meta.dart';

@immutable
class AppState {
  final int resources;
  final int asteroids;

  const AppState({
    @required this.resources,
    @required this.asteroids,
  });
}
