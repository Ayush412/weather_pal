import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geocoding/geocoding.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:weather/core/util/failures.dart';
import 'package:weather/features/forecast/models/weather.dart';
import 'package:weather/features/forecast/repository/i_forecast_repository.dart';

@LazySingleton(as: IForecastRepository)
class ForecastRepository implements IForecastRepository {
  ForecastRepository(this._dio, this._logger);
  final Dio _dio;
  final Logger _logger;
  @override
  Future<Either<Failure, Weather>> getWeather(
      {required double lat, required double long}) async {
    try {
      final placemarks = await placemarkFromCoordinates(lat, long);
      _logger.d('Location => Placemark fetched ${placemarks.first.locality}');

      final response = await _dio.get('/forecast', queryParameters: {
        'latitude': lat,
        'longitude': long,
        'timezone': 'auto',
        'current': 'temperature_2m',
        'daily':
            'weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset',
        'past_days': 0,
        'forecast_days': 4,
      });
      _logger.d(response.data);

      return right(Weather.fromMap(placemarks.first.locality, response.data));
    } on DioException catch (e) {
      _logger.e(e);
      return left(const Failure.network());
    } catch (e) {
      _logger.e(e);
      return left(const Failure.server());
    }
  }
}
