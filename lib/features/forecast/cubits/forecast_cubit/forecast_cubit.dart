import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:weather/features/forecast/models/weather.dart';
import 'package:weather/features/forecast/repository/i_forecast_repository.dart';

part 'forecast_state.dart';
part 'forecast_cubit.freezed.dart';

@injectable
class ForecastCubit extends Cubit<ForecastState> {
  ForecastCubit(
    this._repository,
    this._logger,
  ) : super(ForecastState.loading());
  final IForecastRepository _repository;
  final Logger _logger;

  void getForecast({bool isRetry = false}) async {
    if (isRetry) {
      emit(const ForecastState.loading());
    }

    final permission = await _checkLocationPermission();
    _logger.d('Location => Permission granted: $permission');

    if (!permission) {
      emit(const ForecastState.locationDenied());
      return;
    }

    state.maybeMap(
      orElse: () => _getForecast(),
      success: (s) {
        emit(s.copyWith(isRefreshing: true));
        _getForecast();
      },
    );
  }

  void _getForecast() async {
    final coordinates = await _getCoordinates()
        .timeout(const Duration(seconds: 15), onTimeout: () {
      return (null, null);
    });

    _logger.d(
        'Location => Coordinates fetched (${coordinates.$1}, ${coordinates.$2})');

    if (coordinates.$1 == null || coordinates.$2 == null) {
      emit(const ForecastState.failure());
      return;
    }

    final lat = coordinates.$1 ?? 17.38;
    final long = coordinates.$2 ?? 78.48;
    final result = await _repository.getWeather(lat: lat, long: long);
    result.fold(
      (l) => emit(const ForecastState.failure()),
      (r) => emit(
        ForecastState.success(
            weather: r, currentForecastIndex: 0, isRefreshing: false),
      ),
    );
  }

  void onForecastIndexChanged(int index) {
    state.maybeMap(
      orElse: () => null,
      success: (s) {
        if (index != s.currentForecastIndex) {
          emit(s.copyWith(currentForecastIndex: index));
        }
      },
    );
  }

  Future<bool> _checkLocationPermission() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    final locationPermission = await Geolocator.requestPermission();
    return locationPermission == LocationPermission.always ||
        locationPermission == LocationPermission.whileInUse;
  }

  Future<(double? lat, double? long)> _getCoordinates() async {
    final locationData = await Geolocator.getCurrentPosition();
    return (locationData.latitude, locationData.longitude);
  }
}
