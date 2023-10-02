import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:planning_poker_clone/controllers/game_controller.dart';
import 'package:planning_poker_clone/main.dart';
import 'package:planning_poker_clone/models/game_status.dart';
import 'package:planning_poker_clone/widgets/card/choose_card_widget.dart';
import 'package:planning_poker_clone/widgets/positioned_widget.dart';
import 'package:planning_poker_clone/widgets/vote/vote_count_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GameController _gameController = getIt<GameController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planning Poker '),
      ),
      body: const PositionedWidget(),
      bottomNavigationBar: Observer(
        builder: (_) => _buildBottomWidget(),
      ),
    );
  }

  Widget _buildBottomWidget() {
    return _gameController.gameStatus == GameStatus.newGame
        ? const VoteCountWidget()
        : const ChooseCardWidget();
  }
}
