import 'package:yumemi_weather/yumemi_weather.dart';

class YumemiApi {
  final YumemiWeather _yumemiWeather = YumemiWeather();
  final List<String> weathers = ['sunny', 'cloudy', 'rainy'];

  String fetchWeather() {
    try {
      final weather = _yumemiWeather.fetchSimpleWeather();
      if (weathers.contains(weather)) {
        return _yumemiWeather.fetchSimpleWeather();
      } else {
        throw Exception('予期せぬ天気です');
      }
    } on Exception {
      rethrow;
    }
  }
}
