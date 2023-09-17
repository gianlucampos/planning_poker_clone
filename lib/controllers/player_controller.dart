// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:planning_poker_clone/models/player_model.dart';
import 'package:planning_poker_clone/repositories/player_repository.dart';

part 'player_controller.g.dart';

class PlayerController = _PlayerController with _$PlayerController;

abstract class _PlayerController with Store {
  late final PlayerRepository _repository;

  _PlayerController({required PlayerRepository repository}) {
     _repository = repository;
  }

  @readonly
  // ignore: prefer_final_fields
  List<PlayerModel> _loggedPlayers = [];

  @readonly
  PlayerModel? _player;

  List<PlayerModel> get loggedPlayers => _loggedPlayers;

  PlayerModel? get player => _player;

  bool allPlayersVoted() =>
      loggedPlayers.where((element) => element.vote == null).isEmpty;

  @action
  void setPlayer(PlayerModel newPlayer) {
    _player = newPlayer;
    addPlayer(newPlayer);
  }

  @action
  void addPlayer(PlayerModel newPlayer) {
    _loggedPlayers.add(newPlayer);
    _repository.addPlayer(newPlayer);
  }

  @action
  void removePlayer(PlayerModel newPlayer) {
    _loggedPlayers.remove(newPlayer);
    _repository.removePlayer(newPlayer);
  }

  @action
  Future<void> loadPlayers() async {
    final players = await _repository.listPlayers();
    _loggedPlayers.addAll(players);
  }
}
