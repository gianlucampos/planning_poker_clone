import 'package:flutter/material.dart';
import 'package:planning_poker_clone/models/game_status.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  // late ContadorProvider contador =
  //     Provider.of<ContadorProvider>(context, listen: false);
  // late GameStatusProvider gameStatusProvider =
  //     Provider.of<GameStatusProvider>(context, listen: false);
  // late GameStatus gameStatus = gameStatusProvider.gameStatus;
  late GameStatus gameStatus = GameStatus.newGame;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    // gameStatusProvider.addListener(() {
    //   setState(() {
    //     gameStatus = gameStatusProvider.gameStatus;
    //   });
    // });
    // contador.addListener(() {
    //   if (contador.segundos == 0) {
    //     gameStatusProvider.changeStatus(GameStatus.newGame);
    //     Provider.of<RotateCardProvider>(context, listen: false).revelarCard();
    //   }
    // });
  }

  void statusController() {
    // switch (gameStatus) {
    //   case GameStatus.voting:
    //     gameStatusProvider.changeStatus(GameStatus.revealCards);
    //     break;
    //   case GameStatus.revealCards:
    //     contador.start();
    //     break;
    //   case GameStatus.newGame:
    //     gameStatusProvider.changeStatus(GameStatus.voting);
    //     Provider.of<RotateCardProvider>(context, listen: false).reset();
    //     Provider.of<VotoProvider>(context, listen: false).reset();
    //     break;
    // }
  }

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
          onPressed: statusController,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: SizedBox(
              width: 200,
              height: 200,
              child: buildTimer(),
            ),
          ),
        ),
      ),
    );
  }

  buildTimer() {
    return Center(
      child: Text(
        '${gameStatus.value}',
        textScaleFactor: 1.5,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  buildConsumer() {
    // return Consumer<ContadorProvider>(
    //           builder: (context, contadorProvider, widget) {
    //             return Center(
    //               child: Text(
    //                 contadorProvider.isActive
    //                     ? '${contadorProvider.segundos}'
    //                     : '${gameStatus.value}',
    //                 textScaleFactor: 1.5,
    //                 style: const TextStyle(
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             );
    //           },
    //         );
  }
}
