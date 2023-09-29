// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:planning_poker_clone/controllers/card_controller.dart';
import 'package:planning_poker_clone/controllers/game_controller.dart';
import 'package:planning_poker_clone/main.dart';
import 'package:planning_poker_clone/models/game_status.dart';

part 'timer_controller.g.dart';

class TimerController = _TimerController with _$TimerController;

final GameController _gameController = getIt<GameController>();
final CardController _cardController = getIt<CardController>();

abstract class _TimerController with Store {
  @readonly
  int _seconds = 3;

  get seconds => _seconds;

  @action
  void startTimer() {
    _seconds = 3;
    _gameController.setTableMessage(_seconds.toString());
    Timer.periodic(const Duration(seconds: 1), (timer) => decreaseTimer(timer));
  }

  @action
  void decreaseTimer(Timer timer) {
    _seconds--;
    if (_seconds == 0) {
      timer.cancel();
      _cardController.setShowFrontSide(true);
      _gameController.setGameStatus(GameStatus.newGame);
      return;
    }
    _gameController.setTableMessage(_seconds.toString());
  }
}
