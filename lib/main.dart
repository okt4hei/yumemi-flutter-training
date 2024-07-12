import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  final YumemiWeather _yumemiWeather = YumemiWeather();
  Widget weatherIcon = const Placeholder();

  void reload() {
    final weatherCondition = _yumemiWeather.fetchSimpleWeather();
    setState(() {
      weatherIcon = SvgPicture.asset('assets/$weatherCondition.svg');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                              onPressed: () {},
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
      ),
    );
  }
}
