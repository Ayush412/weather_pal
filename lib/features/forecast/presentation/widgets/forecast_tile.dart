import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/icons/weather_icons.dart';
import 'package:weather/core/util/constants.dart';
import 'package:weather/features/forecast/models/forecast.dart';

class ForecastTile extends StatelessWidget {
  const ForecastTile({
    super.key,
    required this.forecast,
    required this.isSelected,
    required this.onTap,
  });
  final Forecast forecast;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
        height: 120,
        width: (MediaQuery.of(context).size.width - (24 * 5)) / 4,
        decoration: BoxDecoration(
          color: isSelected ? CustomColors.blue : null,
          border: isSelected ? null : Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(48),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Icon(
                switch (forecast.weatherType) {
                  WeatherType.clear => WeatherIcons.clear,
                  WeatherType.partlyClear => WeatherIcons.partly_clear,
                  WeatherType.fog => WeatherIcons.fog,
                  WeatherType.drizzle => WeatherIcons.shower,
                  WeatherType.rain => WeatherIcons.shower,
                  WeatherType.snow => WeatherIcons.snow,
                  WeatherType.thunderstorm => WeatherIcons.thunderstorm,
                },
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            FittedBox(
              child: AutoSizeText(
                DateFormat('d, MMM').format(forecast.date),
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${forecast.highTemp}°C',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
