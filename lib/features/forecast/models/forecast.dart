import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/core/util/constants.dart';

part 'forecast.freezed.dart';

@freezed
class Forecast with _$Forecast {
  const factory Forecast({
    required DateTime date,
    required int? currentTemp,
    required int lowTemp,
    required int highTemp,
    required DateTime sunrise,
    required DateTime sunset,
    required WeatherType weatherType,
  }) = _Forecast;

  // factory Forecast.fromMap(Map data) {
  //   return Forecast(
  //     date: DateTime.parse(data['date']),
  //     currentTemp: data['current'],
  //     lowTemp: data['low'],
  //     highTemp: data['high'],
  //     sunrise: DateTime.parse(data['sunrise']),
  //     sunset: DateTime.parse(data['sunset']),
  //     forecastType: getWeatherType(data['code']),
  //   );
  // }
}
