import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:planning_poker_clone/controllers/player_controller.dart';
import 'package:planning_poker_clone/main.dart';
import 'package:planning_poker_clone/models/player_model.dart';
import 'package:planning_poker_clone/widgets/loading_widget.dart';
import 'package:planning_poker_clone/widgets/player/add_player_modal.dart';
import 'package:planning_poker_clone/widgets/player/player_widget.dart';
import 'package:planning_poker_clone/widgets/table/table_widget.dart';

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
  final List<PlayerModel> _playersScreen = [];
  final PlayerController _playersController = getIt<PlayerController>();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => const AddPlayerModal(),
      ),
    );
    _loadPlayersScreen();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: LoadingWidget(child: _buildTable()),
      ),
    );
  }

  Column _buildTable() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgetsTop,
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(children: widgetsLeft),
            TableWidget(),
            Column(children: widgetsRight),
          ],
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgetsBottom,
        ),
      ],
    );
  }

  Future<void> _loadPlayersScreen() async {
    await _playersController.loadPlayers();
    for (var element in _playersController.loggedPlayers) {
      _addPlayerScreen(element);
    }
  }

  void _resetScren() {
    _playersScreen.clear();
    direction = Direction.top;
    isAdded = false;
    widgetsTop = [];
    widgetsBottom = [];
    widgetsLeft = [];
    widgetsRight = [];
  }

  void _addPlayerScreen(PlayerModel player) {
    _playersScreen.add(player);

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
