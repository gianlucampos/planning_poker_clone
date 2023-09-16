

import 'package:planning_poker_clone/models/player_model.dart';

class PlayerRepository {
  // final Dio dio;
  static const String urlBase =
      'https://planning-poker-spring.herokuapp.com/v1/api/players';

  Future<List<PlayerModel>> listPlayers() async {
    // final response = await _dio.get(_url_base);
    // var players = response.data.map((e) => PlayerModel.fromMap(e));
    // return List<PlayerModel>.from(players);
    return _listPlayersMock();
  }

  Future<List<PlayerModel>> _listPlayersMock() async {
    return [
      PlayerModel(name: 'Gianluca', vote: 'PP'),
      PlayerModel(name: 'Victor', vote: 'PP'),
      PlayerModel(name: 'Caio', vote: 'PP'),
      PlayerModel(name: 'Ricardo', vote: 'P'),
      PlayerModel(name: 'Bruno', vote: 'P'),
      PlayerModel(name: 'Bruna', vote: 'P'),
      PlayerModel(name: 'Renata', vote: 'M'),
      PlayerModel(name: 'Geovanni', vote: 'G'),
    ];
  }
}
