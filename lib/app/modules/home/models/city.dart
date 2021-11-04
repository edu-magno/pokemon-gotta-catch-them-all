import 'package:pokemon_gotta_catch_them_all/app/modules/home/models/simplified_pokemon.dart';

class City {
  final String name;
  final List<SimplifiedPokemon> pokemons;

  City({
    required this.name,
    required this.pokemons,
  });
}
