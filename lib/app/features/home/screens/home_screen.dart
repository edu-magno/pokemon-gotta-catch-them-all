import 'package:flutter/material.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/home/components/cities_tab.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/home/components/pokemons_tab.dart';
import 'package:pokemon_gotta_catch_them_all/app/shared/theme/colors.dart';
import 'package:pokemon_gotta_catch_them_all/app/shared/utils/pokemon_icons.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'lib/assets/images/pokemon_logo.png',
            width: MediaQuery.of(context).size.width * 0.90,
            height: 83,
          ),
        ),
        body: TabBarView(children: [
          PokemonTab(),
          CitiesTab(),
        ]),
        bottomNavigationBar: Material(
          color: PokemonColors.leCorbusierCrush,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(5))),
          child: SizedBox(
            height: 58,
            child: Column(
              children: const [
                SizedBox(
                  height: 10,
                ),
                TabBar(tabs: [
                  Tab(icon: Icon(PokemonIcons.pokemonIcon)),
                  Tab(icon: Icon(PokemonIcons.citiesIcon)),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
