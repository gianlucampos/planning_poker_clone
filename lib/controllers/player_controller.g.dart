// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerController on _PlayerController, Store {
  late final _$_loggedPlayersAtom =
      Atom(name: '_PlayerController._loggedPlayers', context: context);

  List<PlayerModel> get loggedPlayers {
    _$_loggedPlayersAtom.reportRead();
    return super._loggedPlayers;
  }

  @override
  List<PlayerModel> get _loggedPlayers => loggedPlayers;

  @override
  set _loggedPlayers(List<PlayerModel> value) {
    _$_loggedPlayersAtom.reportWrite(value, super._loggedPlayers, () {
      super._loggedPlayers = value;
    });
  }

  late final _$_playerAtom =
      Atom(name: '_PlayerController._player', context: context);

  PlayerModel? get player {
    _$_playerAtom.reportRead();
    return super._player;
  }

  @override
  PlayerModel? get _player => player;

  @override
  set _player(PlayerModel? value) {
    _$_playerAtom.reportWrite(value, super._player, () {
      super._player = value;
    });
  }

  late final _$loadPlayersAsyncAction =
      AsyncAction('_PlayerController.loadPlayers', context: context);

  @override
  Future<void> loadPlayers() {
    return _$loadPlayersAsyncAction.run(() => super.loadPlayers());
  }

  late final _$_PlayerControllerActionController =
      ActionController(name: '_PlayerController', context: context);

  @override
  void setPlayer(PlayerModel newPlayer) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.setPlayer');
    try {
      return super.setPlayer(newPlayer);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPlayer(PlayerModel newPlayer) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.addPlayer');
    try {
      return super.addPlayer(newPlayer);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removePlayer(PlayerModel newPlayer) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.removePlayer');
    try {
      return super.removePlayer(newPlayer);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
