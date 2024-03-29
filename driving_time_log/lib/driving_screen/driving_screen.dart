import 'package:driving_time_log/driving_screen/cubit/driving_cubit.dart';
import 'package:driving_time_log/main.dart';
import 'package:driving_time_log/resources/assets.dart';
import 'package:driving_time_log/resources/colors.dart';
import 'package:driving_time_log/resources/date_functions.dart';
import 'package:driving_time_log/resources/maps_Lists_enums.dart';
import 'package:driving_time_log/resources/widgets/button_with_icon.dart';
import 'package:driving_time_log/resources/widgets/current_days_logs.dart';
import 'package:driving_time_log/resources/widgets/edit_details_dialog/edit_details_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrivingScreen extends StatelessWidget {
  const DrivingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var box = Hive.box<List>(logBox);

    var local = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => DrivingCubit(),
      child: BlocBuilder<DrivingCubit, DrivingState>(
        builder: (context, state) {
          Map<String, dynamic> _drive = {
            'type': 'driving',
            'startTime': '13:30',
            'endTime': '14:00',
            'startKm': '120 001',
            'endKm': '120 135',
            'VehicleTag': 'ABC-123',
            'description': 'food or smthg'
          };
          Map<String, dynamic> _service = {
            'type': 'service',
            'startTime': '14:00',
            'endTime': '15:58',
            // 'startKm': '',
            // 'endKm': '120 135',
            // 'vehicleTag': 'ABC-123',
            'description': 'food or smthg'
          };
          Map<String, dynamic> _other = {
            'type': 'otherWork',
            'startTime': '15:58',
            'endTime': '17:30',
            // 'startKm': '',
            // 'endKm': '120 135',
            // 'vehicleTag': 'ABC-123',
            'description': 'lastaus'
          };
          Map<String, dynamic> _sleepAndBreak = {
            'type': 'sleepAndBreak',
            'startTime': '17:30',
            'endTime': '18:00',
            // 'startKm': '',
            // 'endKm': '120 135',
            // 'vehicleTag': 'ABC-123',
            'description': 'sleep'
          };
          Map<String, dynamic> _out = {
            'type': 'out',
            'startTime': '18:00',
            'endTime': '22:45',
            // 'startKm': '',
            // 'endKm': '120 135',
            // 'vehicleTag': 'ABC-123',
            'description': 'out yes'
          };
          var testList = [_drive, _service, _other, _sleepAndBreak, _out];
          //TODO: When app is restarted the pressed button is not kept and will go back to default
          //save the pressed button to button box when the custom enum typeadapter is made

          //TODO: if app is left open overnight the day willnot refres until reopened
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
                      children: [
                        Expanded(
                          child: ButtonWithIcon(
                            text: local.out,
                            color: cyan,
                            icon: out,
                            selected: state.enabledIcon == IconsAndNames.out,
                            enabled: !(state.enabledIcon == IconsAndNames.out),
                            onTap: () {
                              context.read<DrivingCubit>().buttonPressed(button: IconsAndNames.out);
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ButtonWithIcon(
                            text: local.breeak,
                            color: orange,
                            icon: sleepAndBreak,
                            selected: state.enabledIcon == IconsAndNames.sleepAndBreak,
                            enabled: !(state.enabledIcon == IconsAndNames.sleepAndBreak),
                            onTap: () {
                              context.read<DrivingCubit>().buttonPressed(button: IconsAndNames.sleepAndBreak);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: ButtonWithIcon(
                            text: local.service,
                            color: red,
                            icon: service,
                            selected: state.enabledIcon == IconsAndNames.service,
                            enabled: !(state.enabledIcon == IconsAndNames.service),
                            onTap: () {
                              context.read<DrivingCubit>().buttonPressed(button: IconsAndNames.service);
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ButtonWithIcon(
                            text: local.other,
                            color: blue,
                            icon: otherWork,
                            selected: state.enabledIcon == IconsAndNames.otherWork,
                            enabled: !(state.enabledIcon == IconsAndNames.otherWork),
                            onTap: () {
                              context.read<DrivingCubit>().buttonPressed(button: IconsAndNames.otherWork);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ButtonWithIcon(
                      text: local.driving,
                      color: green,
                      icon: driving,
                      center: true,
                      selected: state.enabledIcon == IconsAndNames.driving,
                      enabled: !(state.enabledIcon == IconsAndNames.driving),
                      onTap: () {
                        context.read<DrivingCubit>().buttonPressed(button: IconsAndNames.driving);
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
                      //TODO: remove and edit button for v1.0 relase
                      GestureDetector(
                        onTap: () {
                          box.delete(dateTimeToDDMMYYYY(DateTime.now()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Text(
                            'delete -',
                            style: theme.bodyText1,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          detailsDialog(context: context);
                          //TODO: this can be used to generate test list
                          //box.put(dateTimeToDDMMYYYY(DateTime.now()), testList);
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
                  CurrentDayLogs(day: DateTime.now()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
