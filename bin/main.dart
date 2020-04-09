import 'package:console/console.dart' show Console, Prompter;

import 'package:hangman/console_utils.dart';
import 'package:hangman/hangman.dart';
import 'package:english_words/english_words.dart' as engWords;

final List<String> wordList = engWords.all.where((String word) => word.length > 2 && word.length < 8).map((String word) => word.toUpperCase()).toList();

final game = HangmanGame(wordList);

void main() {
  game.onWordChange.listen((String wordForDisplay) => print(wordForDisplay));

  game.newGame();

  Console.setTextColor(ConsoleColor.blue.index);
  Console.write("Make your first guess: ");
}
