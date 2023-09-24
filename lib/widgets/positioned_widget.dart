import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:planning_poker_clone/controllers/game_controller.dart';
import 'package:planning_poker_clone/controllers/player_controller.dart';
import 'package:planning_poker_clone/main.dart';
import 'package:planning_poker_clone/models/player_model.dart';
import 'package:planning_poker_clone/widgets/loading_widget.dart';
import 'package:planning_poker_clone/widgets/player/add_player_modal.dart';
import 'package:planning_poker_clone/widgets/player/player_widget.dart';
import 'package:planning_poker_clone/widgets/table/table_widget.dart';
import 'package:universal_html/html.dart';

enum Direction { top, bottom, left, right }

Direction direction = Direction.top;
bool isAdded = false;
List<Widget> widgetsTop = [];
List<Widget> widgetsBottom = [];
List<Widget> widgetsLeft = [];
List<Widget> widgetsRight = [];

class PositionedWidget extends StatefulWidget {
  const PositionedWidget({Key? key}) : super(key: key);

  @override
  State<PositionedWidget> createState() => _PositionedWidgetState();
}

class _PositionedWidgetState extends State<PositionedWidget> {
  final PlayerController _playersController = getIt<PlayerController>();
  final GameController _gameController = getIt<GameController>();
  final DatabaseReference _database = getIt<DatabaseReference>();
  late final StreamSubscription<DatabaseEvent> _streamPlayersUpdate;

  @override
  void initState() {
    super.initState();
    window.addEventListener('beforeunload', _beforeUnload);
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => const AddPlayerModal(),
      ),
    );
    //Two options TODO implement the solution 2
    // 1 - Put a listanable here and then setState((){ _loadPlayersScreen()})
    // 2 - Put the build logic inside controller and retrieve here with observables
    _gameController.loadGame();
    _streamPlayersUpdate =
        _database.child('players').onValue.listen((DatabaseEvent event) {
      _loadPlayersScreen();
    });
  }

  @override
  void dispose() {
    _streamPlayersUpdate.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: LoadingWidget(child: _buildTable()),
    );
  }

  Widget _buildTable() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgetsTop,
          ),
          const SizedBox(height: 50),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(children: widgetsLeft),
                TableWidget(),
                Column(children: widgetsRight),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgetsBottom,
          ),
        ],
      ),
    );
  }

  void _beforeUnload(Event e) {
    _playersController.removeLoggedPlayer();
  }

  Future<void> _loadPlayersScreen() async {
    _resetScreen();
    await _playersController.loadPlayers();
    for (var element in _playersController.loggedPlayers) {
      _addPlayerScreen(element);
    }
  }

  void _resetScreen() {
    direction = Direction.top;
    isAdded = false;
    widgetsTop = [];
    widgetsBottom = [];
    widgetsLeft = [];
    widgetsRight = [];
  }

  void _addPlayerScreen(PlayerModel player) {
    _buildTop(player);
    if (isAdded) {
      isAdded = false;
      return;
    }
    _buildLeft(player);
    if (isAdded) {
      isAdded = false;
      return;
    }
    _buildRight(player);
    if (isAdded) {
      isAdded = false;
      return;
    }
    _buildBottom(player);
    isAdded = false;
  }

  void _buildTop(PlayerModel player) {
    if (widgetsTop.length >= 8) return;

    if (direction == Direction.top) {
      widgetsTop.add(PlayerWidget(player: player));
      direction = Direction.bottom;
      isAdded = true;
      super.setState(() {});
    }
  }

  void _buildLeft(PlayerModel player) {
    if (direction == Direction.left) {
      widgetsLeft.add(PlayerWidget(player: player));
      direction = widgetsRight.length < 3 ? Direction.right : Direction.bottom;
      isAdded = true;
      super.setState(() {});
    }
  }

  void _buildRight(PlayerModel player) {
    if (direction == Direction.right) {
      widgetsRight.add(PlayerWidget(player: player));
      super.setState(() {});
      direction = Direction.top;
      isAdded = true;
    }
  }

  void _buildBottom(PlayerModel player) {
    if (widgetsBottom.length >= 8) return;
    if (direction == Direction.bottom) {
      widgetsBottom.add(PlayerWidget(player: player));
      isAdded = true;
      direction = widgetsLeft.length < 3 ? Direction.left : Direction.top;
      super.setState(() {});
    }
  }
}
