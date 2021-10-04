import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/home/models/city.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/home/models/simplified_pokemon.dart';
import '../models/simplified_city.dart';
import '../models/success_cities_response.dart';

class CityRepository {
  CityRepository({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<SuccessCitiesResponse> getCities(String url) async {
    try {
      final result = await _dio.get(url);

      return SuccessCitiesResponse(
        nextUrl: result.data['next'],
        cities: _parseSimplifiedCities(result.data['results']),
      );
    } catch (err) {
      throw err;
    }
  }

  _parseSimplifiedCities(List<dynamic> rawCities) {
    final filtredCities = rawCities.where(
      (area) =>
          (area['name'] as String).contains('city') ||
          (area['name'] as String).contains('town'),
    );

    return filtredCities.map(
      (city) {
        return SimplifiedCity(
          name: city['name'],
          url: city['url'],
        );
      },
    ).toList();
  }

  Future<Either<String, City>> getCity(String url) async {
    try {
      final result = await _dio.get(url);

      final areas = await Future.wait((result.data['areas'] as List).map(
        (area) async => await _dio.get(
          area['url'],
        ),
      ));

      final pokemonsLists = areas
          .map(
            (area) => (area.data['pokemon_encounters'] as List)
                .map(
                  (p) => SimplifiedPokemon(
                    id: (p['pokemon']['url'] as String).split('/')[6],
                    name: p['pokemon']['name'],
                    url: p['pokemon']['url'],
                  ),
                )
                .toList(),
          )
          .toList();

     final pokemons = pokemonsLists.expand((element) => element).toList();

      return Right(
        City(name: result.data['name'], pokemons: pokemons)
      );
    } catch (err) {
      return const Left('Ocorreu um erro');
    }
  }
}
