import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:planning_poker_clone/controllers/game_controller.dart';
import 'package:planning_poker_clone/main.dart';

class TableWidget extends StatelessWidget {
  TableWidget({Key? key}) : super(key: key);

  final GameController _gameController = getIt<GameController>();

  @override
  Widget build(BuildContext context) {
    double widthAvailable = MediaQuery.of(context).size.width;
    double widthTable = widthAvailable * 0.3;
    double widthButton = widthTable * 0.2;
    return Container(
      width: widthTable,
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: widthButton),
        child: TextButton(
          onPressed: _gameController.loadGame,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Center(
              child: Observer(builder: (context) {
                return Text(
                  _gameController.tableMessage,
                  textScaleFactor: 1.5,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
