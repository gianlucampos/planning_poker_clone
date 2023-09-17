// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'vote_controller.g.dart';

class VoteController = _VoteController with _$VoteController;

abstract class _VoteController with Store {
  @readonly
  String? _vote;

  String? get vote => _vote;

  @action
  void setVote(String? newVote) {
    _vote = newVote;
  }
}
