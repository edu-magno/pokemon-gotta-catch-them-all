import 'package:flutter/material.dart';
import 'package:pokemon_gotta_catch_them_all/app/shared/widgets/horizontal_space_8.dart';

class StatWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final double? iconSize;
  final TextStyle? textStyle;
  StatWidget({
    required this.icon,
    required this.text,
    required this.color,
    this.iconSize,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 24,
          color: color,
        ),
        HorizontalSpace8(),
        Text(
          text,
          style: textStyle ?? const TextStyle(fontSize: 24),
        )
      ],
    );
  }
}
