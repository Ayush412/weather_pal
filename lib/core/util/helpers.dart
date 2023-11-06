import 'package:weather/core/util/constants.dart';

WeatherType getWeatherType(int code) {
  switch (code) {
    case 0:
      return WeatherType.clear;
    case >= 1 && <= 2:
      return WeatherType.partlyClear;
    case >= 45 && <= 48:
      return WeatherType.fog;
    case >= 51 && <= 57:
      return WeatherType.drizzle;
    case (>= 61 && <= 65) || (>= 80 && <= 82):
      return WeatherType.rain;
    case (>= 71 && <= 77) || (>= 85 && <= 86):
      return WeatherType.snow;
    case (>= 95 && <= 99):
      return WeatherType.thunderstorm;
    default:
      return WeatherType.clear;
  }
}

String getWeatherAnimation(WeatherType weatherType, {bool isDay = true}) {
  switch (weatherType) {
    case WeatherType.clear:
      return isDay ? AnimationAssets.clearNight : AnimationAssets.clearDay;
    case WeatherType.partlyClear:
      return isDay
          ? AnimationAssets.partlyCloudyDay
          : AnimationAssets.partlyCloudyNight;
    case WeatherType.fog:
      return AnimationAssets.fog;
    case WeatherType.drizzle:
      return isDay ? AnimationAssets.showerDay : AnimationAssets.showerNight;
    case WeatherType.rain:
      return isDay ? AnimationAssets.showerDay : AnimationAssets.showerNight;
    case WeatherType.snow:
      return AnimationAssets.snow;
    case WeatherType.thunderstorm:
      return AnimationAssets.thunderstorm;
  }
}

String getWeatherStatus(
  WeatherType weatherType,
) {
  switch (weatherType) {
    case WeatherType.clear:
      return 'Clear';
    case WeatherType.partlyClear:
      return 'Partly Clear';
    case WeatherType.fog:
      return 'Fog';
    case WeatherType.drizzle:
      return 'Drizzle';
    case WeatherType.rain:
      return 'Rains';
    case WeatherType.snow:
      return 'Snow';
    case WeatherType.thunderstorm:
      return 'Thunder Storm';
  }
}
