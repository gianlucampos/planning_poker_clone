import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:planning_poker_clone/controllers/game_controller.dart';
import 'package:planning_poker_clone/main.dart';

class TableWidget extends StatelessWidget {
  TableWidget({Key? key}) : super(key: key);

  final GameController gameController = getIt<GameController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 550,
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 150),
        child: TextButton(
          onPressed: gameController.controlStatus,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: SizedBox(
              width: 200,
              height: 200,
              child: Center(
                child: Observer(
                  builder: (context) {
                    return Text(
                      gameController.tableMessage,
                      textScaleFactor: 1.5,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
