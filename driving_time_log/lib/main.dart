import 'package:driving_time_log/home_screen.dart';
import 'package:driving_time_log/resources/theme.dart';
import 'package:flutter/material.dart';

void main() {
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
