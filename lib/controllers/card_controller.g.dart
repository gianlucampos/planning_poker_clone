// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardController on _CardController, Store {
  late final _$_showFrontSideAtom =
      Atom(name: '_CardController._showFrontSide', context: context);

  bool get showFrontSide {
    _$_showFrontSideAtom.reportRead();
    return super._showFrontSide;
  }

  @override
  bool get _showFrontSide => showFrontSide;

  @override
  set _showFrontSide(bool value) {
    _$_showFrontSideAtom.reportWrite(value, super._showFrontSide, () {
      super._showFrontSide = value;
    });
  }

  late final _$_CardControllerActionController =
      ActionController(name: '_CardController', context: context);

  @override
  void setShowFrontSide(bool value) {
    final _$actionInfo = _$_CardControllerActionController.startAction(
        name: '_CardController.setShowFrontSide');
    try {
      return super.setShowFrontSide(value);
    } finally {
      _$_CardControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
