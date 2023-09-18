import 'package:flutter/material.dart';
import 'package:planning_poker_clone/controllers/player_controller.dart';
import 'package:planning_poker_clone/main.dart';
import 'package:planning_poker_clone/models/player_model.dart';

class LoadingWidget extends StatelessWidget {
  final Widget child;
  final PlayerController _playersController = getIt<PlayerController>();

  LoadingWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO substituir por streamBuilder
    return FutureBuilder(
      future: loadPlayers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return child;
        } else {
          return const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Future<List<PlayerModel>> loadPlayers() async {
    await Future.delayed(const Duration(seconds: 2));
    return _playersController.loggedPlayers;
  }
}
