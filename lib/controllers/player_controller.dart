// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:planning_poker_clone/models/player_model.dart';
import 'package:planning_poker_clone/repositories/cache_repository.dart';
import 'package:planning_poker_clone/repositories/player_repository.dart';

part 'player_controller.g.dart';

class PlayerController = _PlayerController with _$PlayerController;

abstract class _PlayerController with Store {
  late final PlayerRepository _repository;
  late final CacheRepository _cacheRepository;

  _PlayerController({
    required PlayerRepository repository,
    required CacheRepository cacheRepository,
  }) {
    _repository = repository;
    _cacheRepository = cacheRepository;
  }

  @readonly
  // ignore: prefer_final_fields
  List<PlayerModel> _loggedPlayers = [];

  @readonly
  PlayerModel? _player;

  List<PlayerModel> get loggedPlayers => _loggedPlayers;

  bool allPlayersVoted() =>
      loggedPlayers.where((element) => element.vote == null).isEmpty;

  @action
  Future<PlayerModel?> getLoggedPlayer() async {
    final logged = await _cacheRepository.getLoggedPlayer();
    _player = logged;
    if (logged != null) addLoggedPlayer(logged);
    return logged;
  }

  @action
  Future<void> logoutPlayer() async {
    await _repository.removePlayer(_player!);
  }

  @action
  Future<void> setLoggedPlayer(PlayerModel newPlayer) async {
    await addLoggedPlayer(newPlayer);
    await _cacheRepository.addPlayer(newPlayer);
    _player = newPlayer;
  }

  @action
  Future<void> addLoggedPlayer(PlayerModel newPlayer) async {
    await _repository.addPlayer(newPlayer);
  }

  @action
  Future<void> removeLoggedPlayer() async {
    if (_player != null) {
      await _repository.removePlayer(_player!);
    }
  }

  @action
  Future<void> loadPlayers() async {
    _loggedPlayers.clear();
    await Future.delayed(const Duration(milliseconds: 500));
    final players = await _repository.listLoggedPlayers();
    _loggedPlayers.addAll(players);
  }
}
