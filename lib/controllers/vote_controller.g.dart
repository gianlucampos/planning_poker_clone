// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VoteController on _VoteController, Store {
  late final _$_voteAtom =
      Atom(name: '_VoteController._vote', context: context);

  String? get vote {
    _$_voteAtom.reportRead();
    return super._vote;
  }

  @override
  String? get _vote => vote;

  @override
  set _vote(String? value) {
    _$_voteAtom.reportWrite(value, super._vote, () {
      super._vote = value;
    });
  }

  late final _$_VoteControllerActionController =
      ActionController(name: '_VoteController', context: context);

  @override
  void setVote(String? newVote) {
    final _$actionInfo = _$_VoteControllerActionController.startAction(
        name: '_VoteController.setVote');
    try {
      return super.setVote(newVote);
    } finally {
      _$_VoteControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetVotes() {
    final _$actionInfo = _$_VoteControllerActionController.startAction(
        name: '_VoteController.resetVotes');
    try {
      return super.resetVotes();
    } finally {
      _$_VoteControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
