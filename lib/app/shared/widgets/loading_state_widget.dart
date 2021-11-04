import 'package:flutter/material.dart';

class LoadingStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.90,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
