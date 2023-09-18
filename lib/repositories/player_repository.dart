import 'package:planning_poker_clone/models/player_model.dart';

class PlayerRepository {
  static const String urlBase =
      'https://planning-poker-spring.herokuapp.com/v1/api/players';

  final _playersMock = [
    PlayerModel(name: 'Gianluca', vote: 'PP'),
    PlayerModel(name: 'Victor', vote: 'PP'),
    PlayerModel(name: 'Caio', vote: 'PP'),
    PlayerModel(name: 'Ricardo', vote: 'P'),
    PlayerModel(name: 'Bruno', vote: 'P'),
    PlayerModel(name: 'Bruna', vote: 'P'),
    PlayerModel(name: 'Renata', vote: 'M'),
    PlayerModel(name: 'Geovanni', vote: 'G'),
  ];

  //TODO Get players from a socket channel
  Future<List<PlayerModel>> listLoggedPlayers() async {
    // final response = await _dio.get(_url_base);
    // var players = response.data.map((e) => PlayerModel.fromMap(e));
    // return List<PlayerModel>.from(players);
    return _playersMock;
  }

  //TODO Add player in cache and socket loggedPlayers list
  Future<void> addPlayer(PlayerModel playerModel) async {
    if (_playersMock.contains(playerModel)) {
      throw Exception('There is already a player with this name');
    }
    _playersMock.add(playerModel);
  }

  //TODO Remove player in cache and socket loggedPlayers list
  Future<void> removePlayer(PlayerModel playerModel) async {
    _playersMock.remove(playerModel);
  }
}
