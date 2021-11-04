class Pokemon {
  final String name;
  final String health;
  final String attack;
  final String defense;
  final String speed;
  final String image;
  final List<String> types;
  final List<String> games;

  Pokemon({
    required this.attack,
    required this.defense,
    required this.games,
    required this.health,
    required this.name,
    required this.speed,
    required this.types,
    required this.image,
  });
}
