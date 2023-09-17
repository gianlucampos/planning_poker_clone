import 'package:flutter/material.dart';
import 'package:planning_poker_clone/app_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:planning_poker_clone/controllers/card_controller.dart';
import 'package:planning_poker_clone/controllers/game_controller.dart';
import 'package:planning_poker_clone/controllers/player_controller.dart';
import 'package:planning_poker_clone/controllers/timer_controller.dart';
import 'package:planning_poker_clone/controllers/vote_controller.dart';
import 'package:planning_poker_clone/repositories/player_repository.dart';

void main() {
  setupDI();
  runApp(const AppWidget());
}

final GetIt getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<CardController>(() => CardController());
  getIt.registerLazySingleton<TimerController>(() => TimerController());
  getIt.registerLazySingleton<GameController>(() => GameController());
  getIt.registerLazySingleton<VoteController>(() => VoteController());
  getIt.registerLazySingleton<PlayerRepository>(() => PlayerRepository());
  getIt.registerLazySingleton<PlayerController>(
    () => PlayerController(repository: PlayerRepository()),
  );
}
