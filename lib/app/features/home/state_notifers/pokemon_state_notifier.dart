import 'package:pokemon_gotta_catch_them_all/app/shared/utils/common_state/common_state.dart';

import '../models/pokemon.dart';
import '../repositories/pokemon_repository.dart';
import 'package:state_notifier/state_notifier.dart';

typedef PokemonState = CommonState<String, Pokemon>;

class PokemonStateNotifier extends StateNotifier<PokemonState> {
  PokemonStateNotifier({
    required PokemonRepository pokemonRepository,
  })  : _pokemonRepository = pokemonRepository,
        super(const PokemonState.initial());

  final PokemonRepository _pokemonRepository;

  Future<void> getPokemon(String url) async {
    state = const PokemonState.loading();

    final result = await _pokemonRepository.getPokemon(url);

    result.fold(
      (left) {
        state = PokemonState.failed(left);
      },
      (right) {
        state = PokemonState.successful(right, false, false);
      },
    );
  }
}
