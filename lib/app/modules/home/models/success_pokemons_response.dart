import 'simplified_pokemon.dart';

class SuccessPokemonsResponse {
  final String nextUrl;
  final List<SimplifiedPokemon> pokemons;

  SuccessPokemonsResponse({
    required this.nextUrl,
    required this.pokemons,
  });
}
