import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:planning_poker_clone/controllers/vote_controller.dart';
import 'package:planning_poker_clone/main.dart';

class CardWidget extends StatefulWidget {
  final String voto;

  const CardWidget({Key? key, required this.voto}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  final VoteController _voteController = getIt<VoteController>();

  void voteController() {
    _voteController.setVote(widget.voto);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Observer(builder: (context) {
        return InkWell(
          onTap: voteController,
          child: Container(
            width: 75,
            height: 120,
            decoration: BoxDecoration(
              color: _voteController.vote == widget.voto
                  ? Colors.blue
                  : Colors.white,
              border: Border.all(color: Colors.blueAccent, width: 3),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Center(
              child: Text(
                widget.voto,
                textScaleFactor: 2,
                style: TextStyle(
                  color: _voteController.vote == widget.voto
                      ? Colors.white
                      : Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
