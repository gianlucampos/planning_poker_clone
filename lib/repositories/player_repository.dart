import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:planning_poker_clone/exceptions/errors.dart';
import 'package:planning_poker_clone/main.dart';
import 'package:planning_poker_clone/models/player_model.dart';

class PlayerRepository {
  final DatabaseReference _database = getIt<DatabaseReference>();

  Future<List<PlayerModel>> listLoggedPlayers() async {
    DataSnapshot playersRef = await _database.child('players').get();
    if (!playersRef.exists) return [];
    var players = playersRef.value as Map;
    return players.values.map((player) => PlayerModel.fromMap(player)).toList();
  }

  Future<void> addPlayer(PlayerModel playerModel) async {
    //TODO use PlayerController.loggedPlayers instead to spare database request
    DataSnapshot player =
        await _database.child('players/${playerModel.name}').get();
    if (player.exists) {
      throw PlayerAlreadyAdded('There is already a player with this name');
    }
    await _database
        .child('players/${playerModel.name}')
        .set(playerModel.toMap());
  }

  Future<void> removePlayer(PlayerModel playerModel) async {
    await _database.child('players/${playerModel.name}').remove();
  }

  Future<void> setPlayerVote({
    required String playerName,
    required String? playerVote,
  }) async {
    await _database.child('players/$playerName/vote').set(playerVote);
  }

  Future<void> resetVotes() async {
    var players = await listLoggedPlayers();
    if (players.isEmpty) return;
    players = players.map((e) => PlayerModel(name: e.name)).toList();
    final map = {for (var e in players) e.name: e.toMap()};
    await _database.child('players').update(map);
  }
}
