import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon_gotta_catch_them_all/app/modules/home/models/simplified_city.dart';
import 'package:pokemon_gotta_catch_them_all/app/modules/home/providers/home_providers.dart';
import 'package:pokemon_gotta_catch_them_all/app/modules/home/widgets/city_card_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CitiesTab extends StatefulWidget {
  @override
  State<CitiesTab> createState() => _CitiesTabState();
}

class _CitiesTabState extends State<CitiesTab> {
  static const _pageSize = 20;
  String? nextUrl;

  final PagingController<int, SimplifiedCity> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) async {
      final result = await context.read(cityRepositoryProvider).getCities(
          pageKey == 0 ? 'https://pokeapi.co/api/v2/location/' : nextUrl!);

      setState(() {
        nextUrl = result.nextUrl;
      });
      final nextPageKey = pageKey + result.cities.length;
      _pagingController.appendPage(result.cities, nextPageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, SimplifiedCity>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, city, index) => CityCardWidget(
          name: city.name,
          url: city.url,
        ),
      ),
    );
  }
}
