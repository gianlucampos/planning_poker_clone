import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:planning_poker_clone/core/app_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:planning_poker_clone/controllers/card_controller.dart';
import 'package:planning_poker_clone/controllers/game_controller.dart';
import 'package:planning_poker_clone/controllers/player_controller.dart';
import 'package:planning_poker_clone/controllers/timer_controller.dart';
import 'package:planning_poker_clone/controllers/vote_controller.dart';
import 'package:planning_poker_clone/firebase_options.dart';
import 'package:planning_poker_clone/repositories/cache_repository.dart';
import 'package:planning_poker_clone/repositories/player_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupDI();
  runApp(const AppWidget());
}

final GetIt getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<PlayerRepository>(() => PlayerRepository());
  getIt.registerLazySingleton<CacheRepository>(() => CacheRepository());

  getIt.registerLazySingleton<CardController>(() => CardController());
  getIt.registerLazySingleton<TimerController>(() => TimerController());
  getIt.registerLazySingleton<GameController>(() => GameController());
  getIt.registerLazySingleton<VoteController>(() => VoteController());
  getIt.registerLazySingleton<PlayerController>(
    () => PlayerController(
      repository: PlayerRepository(),
      cacheRepository: CacheRepository(),
    ),
  );
}
