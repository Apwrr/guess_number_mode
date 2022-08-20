import 'dart:io';
import 'Game.dart';

void main() {

  int result = 1;
  int again = 0;
  int count =0;
  var game;
  var maxNumber;
  List<int> listGame = [];

  // while (!correctFormat) {
  stdout.write('Enter the maximum number to random: ');
  var max = stdin.readLineSync();
  maxNumber = int.tryParse(max!);
  maxNumber ??= 100;
  // }
  print('╔═════════════════════════════════════');
  print('║            GUESS THE NUMBER         ');
  print('║─────────────────────────────────────');

  game = Game(maxNumber);

  do {
    if (result != 0 || again == 1) {
      stdout.write('║ Please guess the between 1 and $maxNumber: ');
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!);

      if (guess == null) {
        print('please enter number only');
        print('║─────────────────────────────────────');
        continue;
      } else {
        count++;
      }
      result = game.doGuess(guess, count);
      if (result == 0) {
        again = 1;
        listGame.add(count);
      }
    }
    if (result == 0) {
      again = 0;
      stdout.write('║ Do you want to play again? y/n: ');
      var reply = stdin.readLineSync();
      if (reply!.compareTo('y') == 0) {
        print('╚═════════════════════════════════════');
        again = 1;
        print('╔═════════════════════════════════════');
        print('║            GUESS THE NUMBER         ');
        print('║─────────────────────────────────────');
        game = Game(maxNumber);
        count = 0;
      }
    }
  } while (result != 0 || again == 1);
  print('║─────────────────────────────────────');
  print('║                THE END              ');
  print('╚═════════════════════════════════════');

  int sum = listGame.length;
  print("You've played $sum games");
  for(int i=0; i<listGame.length; i++){
    int j = i+1;
    int x = listGame[i];
    print("Game #$j: $x guesses");
  }
}
