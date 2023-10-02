import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:planning_poker_clone/controllers/player_controller.dart';
import 'package:planning_poker_clone/main.dart';

class CardVoteWidget extends StatelessWidget {
  final String vote;

  final PlayerController _playerController = getIt<PlayerController>();

  CardVoteWidget({Key? key, required this.vote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _buildBarCount(),
      _buildCard(),
      Observer(
        builder: (context) {
          return Text('${_voteCount()} vote(s)');
        },
      )
    ]);
  }

  Container _buildBarCount() {
    return Container(
      height: 150,
      width: 30,
      decoration: BoxDecoration(
        border: Border.all(width: 3),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: RotatedBox(
        quarterTurns: -1,
        child: LinearProgressIndicator(
            backgroundColor: Colors.white,
            value: _votePercent(),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1A2935))),
      ),
    );
  }

  Padding _buildCard() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 120,
        width: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFF1A2935), width: 3),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: Text(
            vote,
            textScaleFactor: 1.8,
            style: const TextStyle(
              color: Color(0xFF1A2935),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  int _voteCount() {
    if (_playerController.loggedPlayers.isEmpty) return 0;
    return _playerController.loggedPlayers
        .where((element) => element.vote == vote)
        .length;
  }

  double _votePercent() {
    if (_playerController.loggedPlayers.isEmpty) return 0;
    if( _voteCount() == 0) return 0;
    return  _voteCount() / _playerController.loggedPlayers.length;
  }
}
