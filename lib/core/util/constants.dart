import 'dart:ui';

enum WeatherType {
  clear,
  partlyClear,
  fog,
  drizzle,
  rain,
  snow,
  thunderstorm,
}

class AnimationAssets {
  static const clearDay = 'assets/weather_animations/clear_day.json';
  static const clearNight = 'assets/weather_animations/clear_day.json';
  static const fog = 'assets/weather_animations/fog.json';
  static const overcast = 'assets/weather_animations/overcast.json';
  static const partlyCloudyDay =
      'assets/weather_animations/partly_cloudy_day.json';
  static const partlyCloudyNight =
      'assets/weather_animations/partly_cloudy_night.json';
  static const showerDay = 'assets/weather_animations/shower_day.json';
  static const showerNight = 'assets/weather_animations/shower_night.json';
  static const snow = 'assets/weather_animations/snow.json';
  static const thunderstorm = 'assets/weather_animations/thunderstorm.json';
}

class CustomColors {
  static const background = Color(0xFF020B16);
  static const blue = Color(0xFF064EE3);
}
