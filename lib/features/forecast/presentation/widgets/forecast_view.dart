import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/core/icons/weather_icons.dart';
import 'package:weather/core/util/helpers.dart';
import 'package:weather/features/forecast/models/forecast.dart';

class ForecastView extends StatefulWidget {
  const ForecastView({super.key, required this.index, required this.forecast});
  final int index;
  final Forecast forecast;

  @override
  State<ForecastView> createState() => _ForecastViewState();
}

class _ForecastViewState extends State<ForecastView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Text(
          getWeatherStatus(widget.forecast.weatherType),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: LottieBuilder.asset(
            getWeatherAnimation(widget.forecast.weatherType,
                isDay: widget.index > 0 ||
                    (widget.forecast.date.hour >= 5 &&
                        widget.forecast.date.hour <= 18)),
          ),
        ),
        Text(
          '${widget.forecast.currentTemp ?? widget.forecast.lowTemp}°',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 64,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 32),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 120,
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ForecastInfoItem(
                icon: WeatherIcons.temp_low,
                content: '${widget.forecast.lowTemp}°C',
                title: 'Low',
              ),
              ForecastInfoItem(
                icon: WeatherIcons.temp_high,
                content: '${widget.forecast.highTemp}°C',
                title: 'High',
              ),
              ForecastInfoItem(
                icon: WeatherIcons.sunrise,
                content: DateFormat('h:mm a').format(widget.forecast.sunrise),
                title: 'Sunrise',
              ),
              ForecastInfoItem(
                icon: WeatherIcons.sunset,
                content: DateFormat('h:mm a').format(widget.forecast.sunset),
                title: 'Sunset',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ForecastInfoItem extends StatelessWidget {
  const ForecastInfoItem({
    super.key,
    required this.icon,
    required this.content,
    required this.title,
  });
  final IconData icon;
  final String content;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ((MediaQuery.of(context).size.width - 32) - (16 * 6)) / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
          const Spacer(),
          AutoSizeText(
            content,
            maxLines: 1,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          AutoSizeText(
            title,
            maxLines: 1,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          )
        ],
      ),
    );
  }
}
