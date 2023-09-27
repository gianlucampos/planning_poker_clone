// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';
import 'package:planning_poker_clone/controllers/card_controller.dart';
import 'package:planning_poker_clone/controllers/player_controller.dart';
import 'package:planning_poker_clone/controllers/timer_controller.dart';
import 'package:planning_poker_clone/controllers/vote_controller.dart';
import 'package:planning_poker_clone/main.dart';
import 'package:planning_poker_clone/models/enum_utils.dart';
import 'package:planning_poker_clone/models/game_status.dart';
import 'package:planning_poker_clone/repositories/game_repository.dart';

part 'game_controller.g.dart';

class GameController = _GameController with _$GameController;

final TimerController _timerController = getIt<TimerController>();
final CardController _cardController = getIt<CardController>();
final VoteController _voteController = getIt<VoteController>();
final PlayerController _playerController = getIt<PlayerController>();
final DatabaseReference _database = getIt<DatabaseReference>();

abstract class _GameController with Store {
  late final GameRepository _repository;
  late final StreamSubscription<DatabaseEvent> _streamGameUpdate;

  _GameController({required GameRepository repository}) {
    _repository = repository;
    _streamGameUpdate =
        _database.child('game/status').onValue.listen((DatabaseEvent event) {
      final gameStatus =
          EnumUtils.valueOf(GameStatus.values, event.snapshot.value.toString());
         _gameStatus = gameStatus;
    });
  }

  @readonly
  GameStatus _gameStatus = GameStatus.voting;

  @readonly
  String _tableMessage = GameStatus.voting.value;

  get gameStatus => _gameStatus;

  String get tableMessage => _tableMessage;

  @action
  void setGameStatus(GameStatus newGameStatus) {
    _gameStatus = newGameStatus;
    if (_gameStatus != GameStatus.countingDown) {
      _tableMessage = newGameStatus.value;
    }
    _repository.setGameStatus(gameStatus);
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
        _gameStatus = GameStatus.countingDown;
        break;
      case GameStatus.newGame:
        setGameStatus(GameStatus.voting);
        _cardController.setShowFrontSide(false);
        _voteController.setVote(null);
        break;
    }
  }

  @action
  Future<void> loadGame() async {
    _gameStatus = await _repository.getGameStatus();
  }

  void dispose() async {
    await _streamGameUpdate.cancel();
  }
}
