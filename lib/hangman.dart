import 'dart:async';

class HangmanGame {
  static const hanged = 7;

  final List<String> wordList;
  final Set<String> lettersGuessed = {};

  List<String> _wordToGuess;
  List<String> get wordToGuess => List<String>.unmodifiable(_wordToGuess);

  int _wrongGuesses;
  int get wrongGuess => _wrongGuesses;

  HangmanGame(List<String> words) : wordList = words.toList();

  void newGame() {
    wordList.shuffle();
    _wordToGuess = wordList.first.split('');
    _wrongGuesses = 0;
    lettersGuessed.clear();
  }

  void guessLetter(String letter) {
    lettersGuessed.add(letter);

    if (_wordToGuess.contains(letter)) {

    }
    else {

    }
  }

  String get wordForDisplay => wordToGuess.map((String letter) =>
    lettersGuessed.contains(letter) ? letter : '_').join();
}