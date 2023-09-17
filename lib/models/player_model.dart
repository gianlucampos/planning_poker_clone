class PlayerModel {
  final String name;
  final String? vote;

  PlayerModel({
    required this.name,
    this.vote,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'vote': vote,
    };
  }

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
      name: map['name'],
      vote: map['vote'] != null ? map['vote'] as String : null,
    );
  }

  @override
  String toString() => '\nPlayerModel(name: $name, vote: $vote)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerModel &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
