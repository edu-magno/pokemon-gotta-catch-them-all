import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/home/repositories/city_repository.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/home/repositories/pokemon_repository.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/home/state_notifers/city_state_notiifer.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/home/state_notifers/pokemon_state_notifier.dart';

final pokemonRepositoryProvider =
    Provider((ref) => PokemonRepository(dio: Dio()));

final cityRepositoryProvider = Provider((ref) => CityRepository(dio: Dio()));

final pokemonRepositoryStateNotiferProvider =
    StateNotifierProvider.autoDispose<PokemonStateNotifier, PokemonState>(
  (ref) => PokemonStateNotifier(
    pokemonRepository: ref.read(pokemonRepositoryProvider),
  ),
);

final cityepositoryStateNotiferProvider =
    StateNotifierProvider.autoDispose<CityStateNotifier, CityState>(
  (ref) => CityStateNotifier(
    cityRepository: ref.read(cityRepositoryProvider),
  ),
);
