import 'package:flutter/material.dart';
import 'package:flutter_training/pages/weather_page.dart';

class GreenPage extends StatefulWidget {
  const GreenPage({super.key});

  @override
  State<GreenPage> createState() => GreenPageState();
}

class GreenPageState extends State<GreenPage> {
  void movePage() {
    Future.delayed(const Duration(milliseconds: 500), () async {
        if (mounted) {
          await Navigator.of(context).push(
            MaterialPageRoute<void>(builder:(context) => const WeatherPage()),
          );
          movePage();  // 戻ってきたら再度移動
        }
    });
  }

  @override
  void initState() {
    super.initState();
    Future(() async {
      await WidgetsBinding.instance.endOfFrame;
      movePage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green);
  }
}
