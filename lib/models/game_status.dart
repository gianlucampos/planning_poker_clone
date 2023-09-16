enum GameStatus { voting, revealCards, newGame }

extension GameStatusExtension on GameStatus {
  static const values = {
    GameStatus.voting: "Pick your cards",
    GameStatus.revealCards: "Reveal cards",
    GameStatus.newGame: "Start new voting",
  };

  String? get value => values[this];
}
