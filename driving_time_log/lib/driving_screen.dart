import 'package:driving_time_log/resources/assets.dart';
import 'package:driving_time_log/resources/colors.dart';
import 'package:driving_time_log/resources/maps_lists_enums.dart';
import 'package:driving_time_log/resources/widgets/button_with_icon.dart';
import 'package:driving_time_log/resources/widgets/current_days_logs.dart';
import 'package:driving_time_log/resources/widgets/edit_details_dialog.dart';
import 'package:driving_time_log/resources/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class DrivingScreen extends StatelessWidget {
  const DrivingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return SafeArea(
      bottom: false,
      right: false,
      left: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //TODO: only one button can be choosen at time if one is choosen and other one is pressed
                  //it will create new log event
                  ButtonWithIcon(
                    text: 'Out',
                    color: cyan,
                    icon: out,
                    onTap: () {
                      print('out');
                    },
                  ),
                  ButtonWithIcon(
                    text: 'Break',
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
                    text: 'Service',
                    color: red,
                    icon: service,
                    onTap: () {
                      print('service');
                    },
                  ),
                  ButtonWithIcon(
                    text: 'Other',
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
                text: 'Driving',
                color: green,
                icon: driving,
                center: true,
                selected: true,
                onTap: () {
                  print('driving');
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's logs:",
                  style: theme.headline2,
                ),
                GestureDetector(
                  onTap: () {
                    detailsDialog(context: context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: accentblue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Add +',
                      style: theme.bodyText1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const CurrentDayLogs(),
          ],
        ),
      ),
    );
  }
}
