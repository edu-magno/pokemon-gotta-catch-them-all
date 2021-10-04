import 'package:flutter/material.dart';

class PokemonImageWidget extends StatelessWidget {
  final String image;

  PokemonImageWidget({required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Image.network(
        image,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
