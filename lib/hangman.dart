import 'dart:async';

class HangmanGame {
  static const hanged = 7;

  final List<String> wordList;
  final Set<String> lettersGuessed = {};

  HangmanWord _wordToGuess;

  int _wrongGuesses;
  int get wrongGuess => _wrongGuesses;

  HangmanGame(List<String> words) : wordList = words.toList();

  void newGame() {
    wordList.shuffle();
    _wordToGuess = HangmanWord(wordList.first);
    _wrongGuesses = 0;
    lettersGuessed.clear();

    // TODO; ANNOUNCE CHANGE
  }

  void guessLetter(String letter) {
    lettersGuessed.add(letter);

    if (_wordToGuess.guessLetter(letter)) {
      // TODO: ANNOUNCE RIGHT GUESS
      // TODO: ANNOUNCE CHANGE

      if (_wordToGuess.isWordComplete) {
        // TODO: ANNOUNCE WIN
      }
    }
    else {
      _wrongGuesses++;

      // TODO: Announce wrong guess

      if (isHanged) {
        // TODO: ANNOUNCE LOSS
      }
    }
  }

  bool get isHanged => _wrongGuesses >= hanged;
}

class HangmanWord {
  static const blank = '_';

  final String word;
  final int uniqueLettersCount;

  List<String> _wordForDisplay;
  String get wordForDisplay => _wordForDisplay.join();

  HangmanWord(this.word) : uniqueLettersCount = word.split('').toSet().length {
    _wordForDisplay = List<String>.filled(word.length, blank);
  }

  bool guessLetter(String letter) {
    final indexes = word.allIndexesOf(letter);

    for (int i = 0; i < indexes.length; i++) {
      _wordForDisplay[i] = letter;
    }

    return indexes.isNotEmpty;
  }

  bool get isWordComplete => !_wordForDisplay.contains(blank);
}

extension StringUtils on String {
  List<int> allIndexesOf(String pattern) {
    final List<int> result = [];

    for (int i = 0; i < this.length; i++) {
      if (this[i] == pattern) {
        result.add(i);
      }
    }

    return result;
  }
}