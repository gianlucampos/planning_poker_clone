// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameController on _GameController, Store {
  late final _$_gameStatusAtom =
      Atom(name: '_GameController._gameStatus', context: context);

  GameStatus get gameStatus {
    _$_gameStatusAtom.reportRead();
    return super._gameStatus;
  }

  @override
  GameStatus get _gameStatus => gameStatus;

  @override
  set _gameStatus(GameStatus value) {
    _$_gameStatusAtom.reportWrite(value, super._gameStatus, () {
      super._gameStatus = value;
    });
  }

  late final _$_tableMessageAtom =
      Atom(name: '_GameController._tableMessage', context: context);

  String get tableMessage {
    _$_tableMessageAtom.reportRead();
    return super._tableMessage;
  }

  @override
  String get _tableMessage => tableMessage;

  @override
  set _tableMessage(String value) {
    _$_tableMessageAtom.reportWrite(value, super._tableMessage, () {
      super._tableMessage = value;
    });
  }

  late final _$loadGameAsyncAction =
      AsyncAction('_GameController.loadGame', context: context);

  @override
  Future<void> loadGame() {
    return _$loadGameAsyncAction.run(() => super.loadGame());
  }

  late final _$_GameControllerActionController =
      ActionController(name: '_GameController', context: context);

  @override
  void setGameStatus(GameStatus newGameStatus) {
    final _$actionInfo = _$_GameControllerActionController.startAction(
        name: '_GameController.setGameStatus');
    try {
      return super.setGameStatus(newGameStatus);
    } finally {
      _$_GameControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTableMessage(String newTableMessage) {
    final _$actionInfo = _$_GameControllerActionController.startAction(
        name: '_GameController.setTableMessage');
    try {
      return super.setTableMessage(newTableMessage);
    } finally {
      _$_GameControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
