import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonTypes {
  PokemonTypes._();

  static const _assetPath = 'lib/assets/icons/pokemon_types';

  static Widget bug = SvgPicture.asset(
    '$_assetPath/bug.svg',
    width: 48,
  );
  static Widget dark = SvgPicture.asset(
    '$_assetPath/dark.svg',
    width: 48,
  );
  static Widget dragon = SvgPicture.asset(
    '$_assetPath/dragon.svg',
    width: 48,
  );
  static Widget electric = SvgPicture.asset(
    '$_assetPath/electric.svg',
    width: 48,
  );
  static Widget fairy = SvgPicture.asset(
    '$_assetPath/fairy.svg',
    width: 48,
  );
  static Widget fighting = SvgPicture.asset(
    '$_assetPath/fighting.svg',
    width: 48,
  );
  static Widget fire = SvgPicture.asset(
    '$_assetPath/fire.svg',
    width: 48,
  );
  static Widget flying = SvgPicture.asset(
    '$_assetPath/flying.svg',
    width: 48,
  );
  static Widget ghost = SvgPicture.asset(
    '$_assetPath/ghost.svg',
    width: 48,
  );
  static Widget grass = SvgPicture.asset(
    '$_assetPath/grass.svg',
    width: 48,
  );
  static Widget ground = SvgPicture.asset(
    '$_assetPath/ground.svg',
    width: 48,
  );
  static Widget ice = SvgPicture.asset(
    '$_assetPath/ice.svg',
    width: 48,
  );
  static Widget normal = SvgPicture.asset(
    '$_assetPath/normal.svg',
    width: 48,
  );
  static Widget poison = SvgPicture.asset(
    '$_assetPath/poison.svg',
    width: 48,
  );
  static Widget psychic = SvgPicture.asset(
    '$_assetPath/psychic.svg',
    width: 48,
  );
  static Widget rock = SvgPicture.asset(
    '$_assetPath/rock.svg',
    width: 48,
  );
  static Widget steel = SvgPicture.asset(
    '$_assetPath/steel.svg',
    width: 48,
  );
  static Widget water = SvgPicture.asset(
    '$_assetPath/water.svg',
    width: 48,
  );

  static Widget typeParser(String type) {
    final types = {
      'bug': bug,
      'dark': dark,
      'dragon': dragon,
      'electric': electric,
      'fairy': fairy,
      'fighting': fighting,
      'fire': fire,
      'flying': flying,
      'ghost': ghost,
      'grass': grass,
      'ground': ground,
      'ice': ice,
      'normal': normal,
      'poison': poison,
      'psychic': psychic,
      'rock': rock,
      'steel': steel,
      'water': water
    };

    final _type = types[type];

    if (_type == null) {
      return Container();
    }

    return _type;
  }
}
