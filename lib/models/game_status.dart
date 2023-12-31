enum GameStatus { voting, revealCards, newGame, countingDown }

extension GameStatusExtension on GameStatus {
  static const values = {
    GameStatus.voting: "Pick your cards",
    GameStatus.revealCards: "Reveal cards",
    GameStatus.newGame: "Start new voting",
    GameStatus.countingDown: "Counting down",
  };

  String get value => values[this]!;
}
