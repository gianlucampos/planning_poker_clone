// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'card_controller.g.dart';

class CardController = _CardController with _$CardController;

abstract class _CardController with Store {

  @readonly
  bool _showFrontSide = false;

  @action
  void setShowFrontSide(bool value) => _showFrontSide = value;

  bool get showFrontSide => _showFrontSide;
}
