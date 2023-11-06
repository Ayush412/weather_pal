import 'package:fpdart/fpdart.dart';
import 'package:weather/core/util/failures.dart';
import 'package:weather/features/forecast/models/weather.dart';

abstract class IForecastRepository {
  Future<Either<Failure, Weather>> getWeather(
      {required double lat, required double long});
}
