import 'package:driving_time_log/resources/assets.dart';
import 'package:driving_time_log/resources/colors.dart';
import 'package:driving_time_log/resources/widgets/button_with_icon.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWithIcon(
                    text: 'out',
                    color: cyan,
                    icon: out,
                    onTap: () {
                      print('out');
                    },
                  ),
                  ButtonWithIcon(
                    text: 'break',
                    color: orange,
                    icon: sleepAndBreak,
                    onTap: () {
                      print('break');
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWithIcon(
                    text: 'service',
                    color: red,
                    icon: service,
                    onTap: () {
                      print('service');
                    },
                  ),
                  ButtonWithIcon(
                    text: 'other',
                    color: blue,
                    icon: otherWork,
                    onTap: () {
                      print('other');
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ButtonWithIcon(
                text: 'driving',
                color: green,
                icon: driving,
                center: true,
                selected: true,
                onTap: () {
                  print('driving');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
