import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/yumemi_api.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  WeatherPageState createState() => WeatherPageState();
}

class WeatherPageState extends State<WeatherPage> {
  final YumemiApi _yumemiApi = YumemiApi();
  Widget weatherIcon = const Placeholder();

  void reload() {
    final weatherCondition = _yumemiApi.fetchWeather();
    setState(() {
      weatherIcon = SvgPicture.asset('assets/$weatherCondition.svg');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Column(
              children: [
                const Spacer(),
                Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: weatherIcon,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '**℃',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: Colors.blue),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '**℃',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Column(
                    children: [
                      const SizedBox(height: 80),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Close'),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: reload,
                              child: const Text('Reload'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
