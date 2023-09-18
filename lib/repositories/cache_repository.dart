import 'dart:convert';

import 'package:planning_poker_clone/models/player_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> addPlayer(PlayerModel player) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('user', jsonEncode(player.toMap()));
  }

  Future<PlayerModel?> getLoggedPlayer() async {
    final SharedPreferences prefs = await _prefs;
    String? userJson = prefs.get('user') as String?;
    if (userJson == null) return null;
    var map = jsonDecode(userJson) as Map<String, dynamic>;
    return PlayerModel.fromMap(map);
  }

  Future<void> clearData() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.clear();
  }
}
