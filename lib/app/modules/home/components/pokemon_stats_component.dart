import 'package:flutter/material.dart';
import 'package:pokemon_gotta_catch_them_all/app/modules/home/widgets/stat_widget.dart';

import 'package:pokemon_gotta_catch_them_all/app/shared/theme/colors.dart';
import 'package:pokemon_gotta_catch_them_all/app/shared/utils/pokemon_icons.dart';
import 'package:pokemon_gotta_catch_them_all/app/shared/widgets/horizontal_space_8.dart';

class PokemonStatsComponent extends StatelessWidget {
  final String health;
  final String attack;
  final String defense;
  final String speed;

  const PokemonStatsComponent({
    required this.health,
    required this.attack,
    required this.defense,
    required this.speed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StatWidget(
          icon: PokemonIcons.lifeIcon,
          text: health,
          color: PokemonColors.leCorbusierCrush,
        ),
        HorizontalSpace8(),
        StatWidget(
          icon: PokemonIcons.speedIcon,
          text: speed,
          color: PokemonColors.bleachedBone,
        ),
        HorizontalSpace8(),
        StatWidget(
          icon: PokemonIcons.attackIcon,
          text: attack,
          color: PokemonColors.pigIron,
        ),
        HorizontalSpace8(),
        StatWidget(
          icon: PokemonIcons.defenseIcon,
          text: defense,
          color: PokemonColors.sereneSea,
        ),
      ],
    );
  }
}
