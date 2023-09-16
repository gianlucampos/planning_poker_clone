import 'package:flutter/material.dart';
import 'package:planning_poker_clone/widgets/card/choose_card_widget.dart';
import 'package:planning_poker_clone/widgets/positioned_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planning Poker'),
      ),
      body: const PositionedWidget(),
      bottomNavigationBar: const ChooseCardWidget(),
    );
  }
}
