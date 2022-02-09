import 'package:driving_time_log/home_screen.dart';
import 'package:driving_time_log/resources/maps_Lists_enums.dart';
import 'package:driving_time_log/resources/theme.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

const logBox = 'logBox';

void main() async {
  await Hive.initFlutter();
  //TODO: think about changing to alzy box so memory can be saved
  await Hive.openBox<List>(logBox);
  //TODO: make typeadpater to support Iconbuttoenum
  await Hive.openBox<String>('buttonBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driving Time Logger',
      theme: darkTheme,
      home: const HomeScreen(),
    );
  }
}
