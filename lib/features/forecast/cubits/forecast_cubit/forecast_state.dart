part of 'forecast_cubit.dart';

@freezed
class ForecastState with _$ForecastState {
  const factory ForecastState.locationDenied() = _Denied;
  const factory ForecastState.loading() = _Loading;
  const factory ForecastState.failure() = _Failure;
  const factory ForecastState.success({
    required Weather weather,
    required int currentForecastIndex,
    required bool isRefreshing,
  }) = _Success;
}
