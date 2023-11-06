import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/core/util/helpers.dart';
import 'package:weather/features/forecast/models/forecast.dart';

part 'weather.freezed.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    required String location,
    required List<Forecast> forecasts,
  }) = _Weather;

  factory Weather.fromMap(String? location, Map data) {
    final Map<String, dynamic> daily = data['daily'];

    return Weather(
      location: location ?? (data['timezone'] as String).split('/')[0],
      forecasts: List.generate(
        4,
        (index) => Forecast(
          date: DateTime.parse(
              index == 0 ? data['current']['time'] : daily['time'][index]),
          currentTemp: index == 0
              ? (data['current']['temperature_2m'] as double?)?.round()
              : null,
          lowTemp: (daily['temperature_2m_min'][index] as double).round(),
          highTemp: (daily['temperature_2m_max'][index] as double).round(),
          sunrise: DateTime.parse(daily['sunrise'][index]),
          sunset: DateTime.parse(daily['sunset'][index]),
          weatherType: getWeatherType(daily['weathercode'][index]),
        ),
      ),
    );
  }
}
