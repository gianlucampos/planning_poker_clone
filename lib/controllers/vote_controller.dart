// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:planning_poker_clone/controllers/player_controller.dart';
import 'package:planning_poker_clone/main.dart';
import 'package:planning_poker_clone/repositories/player_repository.dart';

part 'vote_controller.g.dart';

class VoteController = _VoteController with _$VoteController;

final PlayerController _playerController = getIt<PlayerController>();

abstract class _VoteController with Store {
  final PlayerRepository _playerRepository;

  _VoteController({required PlayerRepository playerRepository})
      : _playerRepository = playerRepository;

  @readonly
  String? _vote;

  String? get vote => _vote;

  @action
  void setVote(String? newVote) {
    _vote = newVote;
    String name = _playerController.player!.name;
    _playerRepository.setPlayerVote(playerName: name, playerVote: _vote);
  }
}
