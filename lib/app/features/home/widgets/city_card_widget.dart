import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/home/components/cities_details_bottom_sheet.dart';
import 'package:pokemon_gotta_catch_them_all/app/shared/theme/colors.dart';

class CityCardWidget extends StatelessWidget {
  final String name;
  final String url;

  CityCardWidget({
    required this.name,
    required this.url,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          name.replaceAll('-', ' '),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        trailing: InkWell(
          onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => CitiesDetailsBottomSheet(url: url,),
              isScrollControlled: true),
          child: const Icon(
            Icons.chevron_right_rounded,
            size: 48,
            color: PokemonColors.sereneSea,
          ),
        ),
      ),
    );
  }
}
