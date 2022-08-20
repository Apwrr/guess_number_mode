import 'dart:math';

class Game {
  int answer = 0; // instance field

  Game(int maxRandom) {
    var r = Random();
    answer = r.nextInt(maxRandom) + 1;
    print('answer = $answer');
  }

  int doGuess(int num, int count) {
    if (num > answer) {
      print('║ $num is too high ▲');
      print('║─────────────────────────────────────');
      return 1;
    } else if (num < answer) {
      print('║ $num is too low ▼');
      print('║─────────────────────────────────────');
      return 1;
    } else {
      print('║ $num is too correct ★, total guesses: $count');
      print('║─────────────────────────────────────');
      return 0;
    }
  }
}
