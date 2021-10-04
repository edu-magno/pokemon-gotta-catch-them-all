import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/home/providers/home_providers.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/home/widgets/bottom_sheet_push_widget.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/shared/widgets/fail_state_widget.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/shared/widgets/loading_state_widget.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/shared/widgets/vertical_space_16.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/shared/widgets/vertical_space_8.dart';

class CitiesDetailsBottomSheet extends StatefulWidget {
  final String url;
  CitiesDetailsBottomSheet({required this.url});

  @override
  State<CitiesDetailsBottomSheet> createState() =>
      _CitiesDetailsBottomSheetState();
}

class _CitiesDetailsBottomSheetState extends State<CitiesDetailsBottomSheet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read(cityepositoryStateNotiferProvider.notifier)
        .getCity(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final state = watch(cityepositoryStateNotiferProvider);

        return state.maybeWhen(
            failed: (fail) => FailStateWidget(fail: fail),
            loading: () => LoadingStateWidget(),
            successful: (success, booleanOption, secondBooleanOption) {
              return FractionallySizedBox(
                heightFactor: 0.90,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BottomSheetPushWidget(),
                        VerticalSpace16(),
                        Text(
                          success.name.replaceAll('-', ' ').toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        VerticalSpace16(),
                        ...success.pokemons.map(
                          (pokemon) => ListTile(
                            leading: SizedBox(
                              width: 64,
                              height: 64,
                              child: Image.network(
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon.id}.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              pokemon.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            orElse: () => Container());
      },
    );
  }
}
