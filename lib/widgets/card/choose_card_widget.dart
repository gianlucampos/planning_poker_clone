import 'package:flutter/material.dart';
import 'package:planning_poker_clone/widgets/card/card_widget.dart';

class ChooseCardWidget extends StatelessWidget {
  const ChooseCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 130,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Column(
              children: [
                Text('Choose your card 👇', textScaleFactor: 2),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    CardWidget(voto: 'PP'),
                    CardWidget(voto: 'P'),
                    CardWidget(voto: 'M'),
                    CardWidget(voto: 'G'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
