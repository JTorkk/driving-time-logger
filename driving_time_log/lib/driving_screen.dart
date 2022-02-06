import 'package:driving_time_log/resources/assets.dart';
import 'package:driving_time_log/resources/colors.dart';
import 'package:driving_time_log/resources/maps_lists_enums.dart';
import 'package:driving_time_log/resources/widgets/button_with_icon.dart';
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's logs:",
                  style: theme.headline2,
                ),
                //TODO: add button to add new log
                //button here
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, position) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: const BoxDecoration(
                      color: accent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              position.toString(),
                              style: theme.bodyText1,
                            ),
                            SvgIcon(
                              assetName: driving,
                              size: 40,
                              color: iconColors['driving'],
                            )
                          ],
                        )),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
