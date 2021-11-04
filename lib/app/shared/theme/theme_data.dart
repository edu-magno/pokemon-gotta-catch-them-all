import 'package:flutter/material.dart';

import 'colors.dart';

final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    //  backgroundColor: PokemonColors.leCorbusierCrush,
    toolbarHeight: 103,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(5),
      ),
    ),
  ),
  // primaryColor: PokemonColors.leCorbusierCrush,
  colorScheme: const ColorScheme(
    primary: PokemonColors.leCorbusierCrush,
    primaryVariant: PokemonColors.leCorbusierCrush,
    secondary: PokemonColors.sereneSea,
    secondaryVariant: PokemonColors.sereneSea,
    surface: Colors.white,
    background: PokemonColors.snowFlake,
    error: PokemonColors.error,
    onPrimary: PokemonColors.snowFlake,
    onSecondary: PokemonColors.pigIron,
    onSurface: PokemonColors.pigIron,
    onBackground: PokemonColors.pigIron,
    onError: PokemonColors.snowFlake,
    brightness: Brightness.light,
  ),
  // backgroundColor: PokemonColors.snowFlake,
  tabBarTheme: const TabBarTheme(
    
    indicator: BoxDecoration(color: PokemonColors.leCorbusierCrush),
    labelColor: PokemonColors.bleachedBone,
    unselectedLabelColor: PokemonColors.snowFlake,
  ),
);
