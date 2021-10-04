import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../shared/widgets/fail_state_widget.dart';
import '../../shared/widgets/loading_state_widget.dart';
import '../../shared/widgets/vertical_space_16.dart';
import 'pokemon_stats_component.dart';
import '../providers/home_providers.dart';
import '../widgets/bottom_sheet_push_widget.dart';
import '../widgets/pokemon_image_widget.dart';
import '../../shared/theme/colors.dart';
import '../../shared/utils/pokemon_types.dart';
import '../../shared/widgets/horizontal_space_8.dart';
import '../../shared/widgets/vertical_space_8.dart';

class PokemonDetailsBottomSheet extends StatefulWidget {
  final String url;

  PokemonDetailsBottomSheet({required this.url});
  @override
  State<PokemonDetailsBottomSheet> createState() =>
      _PokemonDetailsBottomSheetState();
}

class _PokemonDetailsBottomSheetState extends State<PokemonDetailsBottomSheet> {
  @override
  void initState() {
    super.initState();
    context
        .read(pokemonRepositoryStateNotiferProvider.notifier)
        .getPokemon(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final state = watch(pokemonRepositoryStateNotiferProvider);

        return state.maybeWhen(
            failed: (fail) => FailStateWidget(fail: fail),
            loading: () => LoadingStateWidget(),
            successful: (pokemon, booleanOption, secondBooleanOption) =>
                FractionallySizedBox(
                  heightFactor: 0.90,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BottomSheetPushWidget(),
                          VerticalSpace16(),
                          PokemonImageWidget(
                            image: pokemon.image,
                          ),
                          VerticalSpace8(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                pokemon.name,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: PokemonColors.pigIron,
                                ),
                              ),
                              Row(
                                children: pokemon.types
                                    .map((type) => Row(
                                          children: [
                                            HorizontalSpace8(),
                                            HorizontalSpace8(),
                                            PokemonTypes.typeParser(type),
                                          ],
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                          VerticalSpace16(),
                          PokemonStatsComponent(
                              health: pokemon.health,
                              attack: pokemon.attack,
                              defense: pokemon.defense,
                              speed: pokemon.speed),
                          VerticalSpace16(),
                          const Text(
                            'Games that you can find this pokemon',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: PokemonColors.pigIron,
                            ),
                          ),
                          ...pokemon.games.map((game) => Column(
                                children: [
                                  VerticalSpace8(),
                                  Text(
                                    game,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: PokemonColors.pigIron,
                                    ),
                                  ),
                                ],
                              )),
                          VerticalSpace8(),
                        ],
                      ),
                    ),
                  ),
                ),
            orElse: () => Container());
      },
    );
  }
}
