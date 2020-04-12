class Cooldown {

  final int duration;
  final int timeLeft;

  Cooldown({this.duration, this.timeLeft});

  double progress() {
    return timeLeft.toDouble() / duration.toDouble();
  }

  Cooldown copyWith({
    int duration,
    int timeLeft,
  }) {
    return Cooldown(
      duration: duration ?? this.duration,
      timeLeft: timeLeft ?? this.timeLeft,
    );
  }
}