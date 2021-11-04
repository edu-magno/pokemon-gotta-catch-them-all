import 'package:flutter/material.dart';
import 'package:pokemon_gotta_catch_them_all/app/modules/home/components/pokemon_details_bottom_sheet.dart';
import 'package:pokemon_gotta_catch_them_all/app/shared/theme/colors.dart';

class PokemonCardWidget extends StatelessWidget {
  final String name;
  final String image;
  final String url;

  PokemonCardWidget({
    required this.name,
    required this.url,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: SizedBox(
          width: 64,
          height: 64,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        trailing: InkWell(
          onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => PokemonDetailsBottomSheet(
                    url: url,
                  ),
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
