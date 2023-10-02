import 'package:flutter/material.dart';
import 'package:planning_poker_clone/widgets/card/card_vote_widget.dart';

class VoteCountWidget extends StatelessWidget {
  const VoteCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Column(
          children: [
            const Text('Agreement', textScaleFactor: 1.5),
            const SizedBox(height: 15),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                CardVoteWidget(vote: 'PP'),
                CardVoteWidget(vote: 'P'),
                CardVoteWidget(vote: 'M'),
                CardVoteWidget(vote: 'G'),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ],
    );
  }
}
