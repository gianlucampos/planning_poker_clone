import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:planning_poker_clone/exceptions/errors.dart';
import 'package:planning_poker_clone/models/player_model.dart';

class PlayerRepository {
  final DatabaseReference _database = FirebaseDatabase.instance.ref('players');

  final _playersMock = [
    PlayerModel(name: 'Gianluca', vote: 'PP'),
    PlayerModel(name: 'Victor', vote: 'PP'),
    PlayerModel(name: 'Caio', vote: 'PP'),
    PlayerModel(name: 'Ricardo', vote: 'P'),
    PlayerModel(name: 'Bruno', vote: 'P'),
    PlayerModel(name: 'Bruna', vote: 'P'),
    PlayerModel(name: 'Renata', vote: 'M'),
    PlayerModel(name: 'Geovanni', vote: 'G'),
  ];

  Future<List<PlayerModel>> listLoggedPlayers() async {
    final playersRef = await _database.get();
    var players = playersRef.value as List;
    return players.map((player) => PlayerModel.fromMap(player)).toList();
  }

  //TODO Add player in cache and socket loggedPlayers list
  Future<void> addPlayer(PlayerModel playerModel) async {
    if (_playersMock.contains(playerModel)) {
      throw PlayerAlreadyAdded('There is already a player with this name');
    }
    _playersMock.add(playerModel);
  }

  //TODO Remove player in cache and socket loggedPlayers list
  Future<void> removePlayer(PlayerModel playerModel) async {
    _playersMock.remove(playerModel);
  }

//TODO implement vote update

}
