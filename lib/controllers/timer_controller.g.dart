// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimerController on _TimerController, Store {
  late final _$_secondsAtom =
      Atom(name: '_TimerController._seconds', context: context);

  int get seconds {
    _$_secondsAtom.reportRead();
    return super._seconds;
  }

  @override
  int get _seconds => seconds;

  @override
  set _seconds(int value) {
    _$_secondsAtom.reportWrite(value, super._seconds, () {
      super._seconds = value;
    });
  }

  late final _$_TimerControllerActionController =
      ActionController(name: '_TimerController', context: context);

  @override
  void startTimer() {
    final _$actionInfo = _$_TimerControllerActionController.startAction(
        name: '_TimerController.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_TimerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseTimer(Timer timer) {
    final _$actionInfo = _$_TimerControllerActionController.startAction(
        name: '_TimerController.decreaseTimer');
    try {
      return super.decreaseTimer(timer);
    } finally {
      _$_TimerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
