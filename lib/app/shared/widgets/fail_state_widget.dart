import 'package:flutter/material.dart';

class FailStateWidget extends StatelessWidget {
  final String fail;

  FailStateWidget({required this.fail});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.90,
      child: Center(
        child: Text(
          fail,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
