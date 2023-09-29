import 'package:flutter/material.dart';
import 'package:planning_poker_clone/models/player_model.dart';
import 'package:planning_poker_clone/widgets/card/card_animation.dart';

class PlayerWidget extends StatelessWidget {
  final PlayerModel _player;

  const PlayerWidget({Key? key, required PlayerModel player})
      : _player = player,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardAnimation(frontElement: _frontCard(), backElement: _backCard()),
            const SizedBox(height: 15),
            Text(
              _player.name,
              textScaleFactor: 1,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ]),
    );
  }

  Widget _frontCard() {
    return Container(
      key: const ValueKey(false),
      width: 45,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Center(
        child: Text(
          _player.vote ?? '',
          textScaleFactor: 1.5,
          style:
              const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _backCard() {
    return Container(
      key: const ValueKey(true),
      width: 45,
      height: 70,
      decoration: BoxDecoration(
        color: _player.vote == null ? Colors.grey[300] : Colors.lightBlue,
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
