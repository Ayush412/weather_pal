// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Forecast {
  DateTime get date => throw _privateConstructorUsedError;
  int? get currentTemp => throw _privateConstructorUsedError;
  int get lowTemp => throw _privateConstructorUsedError;
  int get highTemp => throw _privateConstructorUsedError;
  DateTime get sunrise => throw _privateConstructorUsedError;
  DateTime get sunset => throw _privateConstructorUsedError;
  WeatherType get weatherType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForecastCopyWith<Forecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastCopyWith<$Res> {
  factory $ForecastCopyWith(Forecast value, $Res Function(Forecast) then) =
      _$ForecastCopyWithImpl<$Res, Forecast>;
  @useResult
  $Res call(
      {DateTime date,
      int? currentTemp,
      int lowTemp,
      int highTemp,
      DateTime sunrise,
      DateTime sunset,
      WeatherType weatherType});
}

/// @nodoc
class _$ForecastCopyWithImpl<$Res, $Val extends Forecast>
    implements $ForecastCopyWith<$Res> {
  _$ForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? currentTemp = freezed,
    Object? lowTemp = null,
    Object? highTemp = null,
    Object? sunrise = null,
    Object? sunset = null,
    Object? weatherType = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentTemp: freezed == currentTemp
          ? _value.currentTemp
          : currentTemp // ignore: cast_nullable_to_non_nullable
              as int?,
      lowTemp: null == lowTemp
          ? _value.lowTemp
          : lowTemp // ignore: cast_nullable_to_non_nullable
              as int,
      highTemp: null == highTemp
          ? _value.highTemp
          : highTemp // ignore: cast_nullable_to_non_nullable
              as int,
      sunrise: null == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sunset: null == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weatherType: null == weatherType
          ? _value.weatherType
          : weatherType // ignore: cast_nullable_to_non_nullable
              as WeatherType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForecastImplCopyWith<$Res>
    implements $ForecastCopyWith<$Res> {
  factory _$$ForecastImplCopyWith(
          _$ForecastImpl value, $Res Function(_$ForecastImpl) then) =
      __$$ForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      int? currentTemp,
      int lowTemp,
      int highTemp,
      DateTime sunrise,
      DateTime sunset,
      WeatherType weatherType});
}

/// @nodoc
class __$$ForecastImplCopyWithImpl<$Res>
    extends _$ForecastCopyWithImpl<$Res, _$ForecastImpl>
    implements _$$ForecastImplCopyWith<$Res> {
  __$$ForecastImplCopyWithImpl(
      _$ForecastImpl _value, $Res Function(_$ForecastImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? currentTemp = freezed,
    Object? lowTemp = null,
    Object? highTemp = null,
    Object? sunrise = null,
    Object? sunset = null,
    Object? weatherType = null,
  }) {
    return _then(_$ForecastImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentTemp: freezed == currentTemp
          ? _value.currentTemp
          : currentTemp // ignore: cast_nullable_to_non_nullable
              as int?,
      lowTemp: null == lowTemp
          ? _value.lowTemp
          : lowTemp // ignore: cast_nullable_to_non_nullable
              as int,
      highTemp: null == highTemp
          ? _value.highTemp
          : highTemp // ignore: cast_nullable_to_non_nullable
              as int,
      sunrise: null == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sunset: null == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weatherType: null == weatherType
          ? _value.weatherType
          : weatherType // ignore: cast_nullable_to_non_nullable
              as WeatherType,
    ));
  }
}

/// @nodoc

class _$ForecastImpl implements _Forecast {
  const _$ForecastImpl(
      {required this.date,
      required this.currentTemp,
      required this.lowTemp,
      required this.highTemp,
      required this.sunrise,
      required this.sunset,
      required this.weatherType});

  @override
  final DateTime date;
  @override
  final int? currentTemp;
  @override
  final int lowTemp;
  @override
  final int highTemp;
  @override
  final DateTime sunrise;
  @override
  final DateTime sunset;
  @override
  final WeatherType weatherType;

  @override
  String toString() {
    return 'Forecast(date: $date, currentTemp: $currentTemp, lowTemp: $lowTemp, highTemp: $highTemp, sunrise: $sunrise, sunset: $sunset, weatherType: $weatherType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.currentTemp, currentTemp) ||
                other.currentTemp == currentTemp) &&
            (identical(other.lowTemp, lowTemp) || other.lowTemp == lowTemp) &&
            (identical(other.highTemp, highTemp) ||
                other.highTemp == highTemp) &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.sunset, sunset) || other.sunset == sunset) &&
            (identical(other.weatherType, weatherType) ||
                other.weatherType == weatherType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, currentTemp, lowTemp,
      highTemp, sunrise, sunset, weatherType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastImplCopyWith<_$ForecastImpl> get copyWith =>
      __$$ForecastImplCopyWithImpl<_$ForecastImpl>(this, _$identity);
}

abstract class _Forecast implements Forecast {
  const factory _Forecast(
      {required final DateTime date,
      required final int? currentTemp,
      required final int lowTemp,
      required final int highTemp,
      required final DateTime sunrise,
      required final DateTime sunset,
      required final WeatherType weatherType}) = _$ForecastImpl;

  @override
  DateTime get date;
  @override
  int? get currentTemp;
  @override
  int get lowTemp;
  @override
  int get highTemp;
  @override
  DateTime get sunrise;
  @override
  DateTime get sunset;
  @override
  WeatherType get weatherType;
  @override
  @JsonKey(ignore: true)
  _$$ForecastImplCopyWith<_$ForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
