// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'vote_controller.g.dart';

class VoteController = _VoteController with _$VoteController;

// final PlayerController _playerController = getIt<PlayerController>();

abstract class _VoteController with Store {
  @readonly
  String? _vote;

  String? get vote => _vote;

  @action
  void setVote(String? newVote) {
    _vote = newVote;
    //TODO implement vote update
    // _playerController.player.vote! = _vote;
    //Update player vote in repository
    //Update player vote in controller
  }
}
