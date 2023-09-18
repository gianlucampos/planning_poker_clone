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

  late final _$getLoggedPlayerAsyncAction =
      AsyncAction('_PlayerController.getLoggedPlayer', context: context);

  @override
  Future<PlayerModel?> getLoggedPlayer() {
    return _$getLoggedPlayerAsyncAction.run(() => super.getLoggedPlayer());
  }

  late final _$logoutPlayerAsyncAction =
      AsyncAction('_PlayerController.logoutPlayer', context: context);

  @override
  Future<void> logoutPlayer() {
    return _$logoutPlayerAsyncAction.run(() => super.logoutPlayer());
  }

  late final _$setLoggedPlayerAsyncAction =
      AsyncAction('_PlayerController.setLoggedPlayer', context: context);

  @override
  Future<void> setLoggedPlayer(PlayerModel newPlayer) {
    return _$setLoggedPlayerAsyncAction
        .run(() => super.setLoggedPlayer(newPlayer));
  }

  late final _$addLoggedPlayerAsyncAction =
      AsyncAction('_PlayerController.addLoggedPlayer', context: context);

  @override
  Future<void> addLoggedPlayer(PlayerModel newPlayer) {
    return _$addLoggedPlayerAsyncAction
        .run(() => super.addLoggedPlayer(newPlayer));
  }

  late final _$removeLoggedPlayerAsyncAction =
      AsyncAction('_PlayerController.removeLoggedPlayer', context: context);

  @override
  Future<void> removeLoggedPlayer(PlayerModel newPlayer) {
    return _$removeLoggedPlayerAsyncAction
        .run(() => super.removeLoggedPlayer(newPlayer));
  }

  late final _$loadPlayersAsyncAction =
      AsyncAction('_PlayerController.loadPlayers', context: context);

  @override
  Future<void> loadPlayers() {
    return _$loadPlayersAsyncAction.run(() => super.loadPlayers());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
