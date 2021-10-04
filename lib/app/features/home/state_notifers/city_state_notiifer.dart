import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/city.dart';
import '../repositories/city_repository.dart';
import '../../shared/utils/common_state/common_state.dart';

typedef CityState = CommonState<String, City>;

class CityStateNotifier extends StateNotifier<CityState> {
  CityStateNotifier({
    required CityRepository cityRepository,
  })  : _cityRepository = cityRepository,
        super(const CityState.initial());

  final CityRepository _cityRepository;

  Future<void> getCity(String url) async {
    state = const CityState.loading();

    final result = await _cityRepository.getCity(url);

    result.fold(
      (left) {
        state = CityState.failed(left);
      },
      (right) {
        state = CityState.successful(right, false, false);
      },
    );
  }
}
