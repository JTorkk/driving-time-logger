import 'package:driving_time_log/home_screen.dart';
import 'package:driving_time_log/resources/maps_Lists_enums.dart';
import 'package:driving_time_log/resources/theme.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

// part 'main.g.dart';

// const logBox = 'logs';
const log = 'log';

//TODO: document structure
//days -> logs -> data

//TODO: think how to store data in hive with the above sturcture
// @HiveType(typeId: 0)
// class Log {
//   @HiveField(0)
//   IconsAndNames? type;
//   @HiveField(1)
//   DateTime? startTime;
//   @HiveField(2)
//   DateTime? endTime;
//   @HiveField(3)
//   int? startKm;
//   @HiveField(4)
//   int? endKm;
//   @HiveField(5)
//   String? vehicleTag;

//   Log(this.type, this.startTime, this.endTime, this.startKm, this.endKm, this.vehicleTag);
// }

// @HiveType(typeId: 1)
// class LogList {
//   @HiveField(0)
//   List<Map<String, dynamic>>? data;

//   LogList(this.data);
// }

void main() async {
  await Hive.initFlutter();
  // Hive.registerAdapter<LogList>(LogListAdapter());
  //TODO: revert baack to list
  // await Hive.openBox<LogList>(logBox);
  await Hive.openBox<List>(log);

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
