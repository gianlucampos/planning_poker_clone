import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:planning_poker_clone/main.dart';
import 'package:planning_poker_clone/models/enum_utils.dart';
import 'package:planning_poker_clone/models/game_status.dart';

class GameRepository {
  final DatabaseReference _database = getIt<DatabaseReference>();

  Future<void> setGameStatus(GameStatus gameStatus) async {
    await _database.child('game/status').set(gameStatus.name);
  }

  Future<GameStatus> getGameStatus() async {
    final result = await _database.child('game/status').get();
    final gameStatus =
        EnumUtils.valueOf(GameStatus.values, result.value as String);
    return gameStatus;
  }
}
