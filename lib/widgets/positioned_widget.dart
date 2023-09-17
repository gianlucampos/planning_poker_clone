import 'package:flutter/material.dart';
import 'package:planning_poker_clone/models/player_model.dart';
import 'package:planning_poker_clone/repositories/player_repository.dart';
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
  final List<PlayerModel> playersScreen = [];

  @override
  void initState() {
    super.initState();
    // socketClient.send(destination: '/app/list');
    // gameProvider.addListener(() {
    //   if(!this.mounted) return;
    //   setState(() {
    loadPlayers();
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
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
        ),
      ),
    );
  }

  Future<void> loadPlayers() async {
    final repository = PlayerRepository();
    final players = await repository.listPlayers();
    for (var element in players) {
      addPlayer(element);
    }
    // reset();
    // gameProvider.players.forEach((player) {
    //   if (playersScreen.any((p) => p.name == player.name)) return;
    //   playersScreen.add(player);
    //   addPlayer(player);
    // });
  }

  void reset() {
    playersScreen.clear();
    direction = Direction.top;
    isAdded = false;
    widgetsTop = [];
    widgetsBottom = [];
    widgetsLeft = [];
    widgetsRight = [];
  }

  void addPlayer(PlayerModel player) {
    playersScreen.add(player);

    buildTop(player);
    if (isAdded) {
      isAdded = false;
      return;
    }
    buildLeft(player);
    if (isAdded) {
      isAdded = false;
      return;
    }
    buildRight(player);
    if (isAdded) {
      isAdded = false;
      return;
    }
    buildBottom(player);
    isAdded = false;
  }

  void buildTop(PlayerModel player) {
    if (widgetsTop.length >= 8) return;

    if (direction == Direction.top) {
      widgetsTop.add(PlayerWidget(player: player));
      direction = Direction.bottom;
      isAdded = true;
      super.setState(() {});
    }
  }

  void buildLeft(PlayerModel player) {
    if (direction == Direction.left) {
      widgetsLeft.add(PlayerWidget(player: player));
      direction = widgetsRight.length < 3 ? Direction.right : Direction.bottom;
      isAdded = true;
      super.setState(() {});
    }
  }

  void buildRight(PlayerModel player) {
    if (direction == Direction.right) {
      widgetsRight.add(PlayerWidget(player: player));
      super.setState(() {});
      direction = Direction.top;
      isAdded = true;
    }
  }

  void buildBottom(PlayerModel player) {
    if (widgetsBottom.length >= 8) return;
    if (direction == Direction.bottom) {
      widgetsBottom.add(PlayerWidget(player: player));
      isAdded = true;
      direction = widgetsLeft.length < 3 ? Direction.left : Direction.top;
      super.setState(() {});
    }
  }
}
