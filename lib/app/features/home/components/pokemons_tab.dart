import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../models/simplified_pokemon.dart';
import '../providers/home_providers.dart';
import '../widgets/pokemon_card_widget.dart';

class PokemonTab extends StatefulWidget {
  @override
  State<PokemonTab> createState() => _PokemonTabState();
}

class _PokemonTabState extends State<PokemonTab> {
  static const _pageSize = 20;
  String? nextUrl;

  final PagingController<int, SimplifiedPokemon> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) async {
      final result = await context.read(pokemonRepositoryProvider).getPokemons(
          pageKey == 0 ? 'https://pokeapi.co/api/v2/pokemon/' : nextUrl!);

      setState(() {
        nextUrl = result.nextUrl;
      });
      final nextPageKey = pageKey + result.pokemons.length;
      _pagingController.appendPage(result.pokemons, nextPageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, SimplifiedPokemon>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, pokemon, index) => PokemonCardWidget(
          name: pokemon.name,
          url: pokemon.url,
          image:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon.id}.png',
        ),
      ),
    );
  }
}
