import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_gotta_catch_them_all/app/features/shared/theme/theme_data.dart';
import 'features/home/screens/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: HomeScreen(),
        theme: appTheme,
      ),
    );
  }
}
