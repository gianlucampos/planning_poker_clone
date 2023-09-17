// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:planning_poker_clone/controllers/card_controller.dart';
import 'package:planning_poker_clone/controllers/player_controller.dart';
import 'package:planning_poker_clone/controllers/timer_controller.dart';
import 'package:planning_poker_clone/controllers/vote_controller.dart';
import 'package:planning_poker_clone/main.dart';
import 'package:planning_poker_clone/models/game_status.dart';

part 'game_controller.g.dart';

class GameController = _GameController with _$GameController;

final TimerController _timerController = getIt<TimerController>();
final CardController _cardController = getIt<CardController>();
final VoteController _voteController = getIt<VoteController>();
final PlayerController _playerController = getIt<PlayerController>();

abstract class _GameController with Store {
  @readonly
  GameStatus _gameStatus = GameStatus.voting;

  @readonly
  String _tableMessage = GameStatus.voting.value;

  get gameStatus => _gameStatus;

  String get tableMessage => _tableMessage;

  @action
  void setGameStatus(GameStatus newGameStatus) {
    _gameStatus = newGameStatus;
    _tableMessage = newGameStatus.value;
  }

  @action
  void setTableMessage(String newTableMessage) {
    _tableMessage = newTableMessage;
  }

  @action
  void controlStatus() {
    switch (gameStatus) {
      case GameStatus.voting:
        if (_playerController.allPlayersVoted()) {
          setGameStatus(GameStatus.revealCards);
        }
        break;
      case GameStatus.revealCards:
        _timerController.startTimer();
        break;
      case GameStatus.newGame:
        setGameStatus(GameStatus.voting);
        _cardController.setShowFrontSide(false);
        _voteController.setVote(null);
        break;
    }
  }
}
