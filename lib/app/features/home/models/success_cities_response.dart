import 'simplified_city.dart';

class SuccessCitiesResponse {
  final String nextUrl;
  final List<SimplifiedCity> cities;

  SuccessCitiesResponse({
    required this.nextUrl,
    required this.cities,
  });
}
