import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/home/models/pokemon.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/home/models/simplified_pokemon.dart';
import '../models/success_pokemons_response.dart';

class PokemonRepository {
  PokemonRepository({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<SuccessPokemonsResponse> getPokemons(String url) async {
    try {
      final result = await _dio.get(url);

      return SuccessPokemonsResponse(
        nextUrl: result.data['next'],
        pokemons: _parseSimplifiedPokemons(result.data['results']),
      );
    } catch (err) {
      throw err;
    }
  }

  Future<Either<String, Pokemon>> getPokemon(String url) async {
    try {
      final result = await _dio.get(url);

      return Right(_parsePokemon(result.data));
    } catch (err) {
      return const Left('Ocorreu um erro');
    }
  }

  _parseSimplifiedPokemons(List<dynamic> rawPokemons) {
    return rawPokemons.map((pokemon) {
      final id = (pokemon['url'] as String).split('/')[6];

      return SimplifiedPokemon(
        name: pokemon['name'],
        url: pokemon['url'],
        id: id,
      );
    }).toList();
  }

  Pokemon _parsePokemon(Map<String, dynamic> rawPokemon) {
    final games = (rawPokemon['game_indices'] as List)
        .map((game) => game['version']['name'] as String)
        .toList();

    final types = (rawPokemon['types'] as List)
        .map((t) => t['type']['name'] as String)
        .toList();

    final stats = (rawPokemon['stats'] as List);

    final health = stats
        .firstWhere((s) => s['stat']['name'] == 'hp')['base_stat']
        .toString();

    final speed = stats
        .firstWhere((s) => s['stat']['name'] == 'speed')['base_stat']
        .toString();

    final attack = stats
        .firstWhere((s) => s['stat']['name'] == 'attack')['base_stat']
        .toString();

    final defense = stats
        .firstWhere((s) => s['stat']['name'] == 'defense')['base_stat']
        .toString();

    return Pokemon(
      image: rawPokemon['sprites']['front_default'],
      attack: attack,
      defense: defense,
      games: games,
      health: health,
      name: rawPokemon['name'],
      speed: speed,
      types: types,
    );
  }
}
