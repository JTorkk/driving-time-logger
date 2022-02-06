import 'package:flutter/material.dart';

class DrivingScreen extends StatelessWidget {
  const DrivingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      right: false,
      left: false,
      child: Container(
        color: Colors.blue,
        child: const Text('DrivingScreen'),
      ),
    );
  }
}
