import 'package:flutter/material.dart';
import 'package:planning_poker_clone/app_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:planning_poker_clone/controllers/card_controller.dart';
import 'package:planning_poker_clone/controllers/game_controller.dart';
import 'package:planning_poker_clone/controllers/timer_controller.dart';

void main() {
  setupDI();
  runApp(const AppWidget());
}

final GetIt getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<CardController>(() => CardController());
  getIt.registerLazySingleton<TimerController>(() => TimerController());
  getIt.registerLazySingleton<GameController>(() => GameController());
}
