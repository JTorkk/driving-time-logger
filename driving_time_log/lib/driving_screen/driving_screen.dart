import 'package:driving_time_log/driving_screen/cubit/driving_cubit.dart';
import 'package:driving_time_log/resources/assets.dart';
import 'package:driving_time_log/resources/colors.dart';
import 'package:driving_time_log/resources/maps_Lists_enums.dart';
import 'package:driving_time_log/resources/widgets/button_with_icon.dart';
import 'package:driving_time_log/resources/widgets/current_days_logs.dart';
import 'package:driving_time_log/resources/widgets/edit_details_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrivingScreen extends StatelessWidget {
  const DrivingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => DrivingCubit(),
      child: BlocBuilder<DrivingCubit, DrivingState>(
        builder: (context, state) {
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
                          selected: state.enabledIcon == IconsAndNames.out,
                          enabled: !(state.enabledIcon == IconsAndNames.out),
                          onTap: () {
                            context.read<DrivingCubit>().setEnabledButton(button: IconsAndNames.out);
                            print('out');
                          },
                        ),
                        ButtonWithIcon(
                          text: 'Break',
                          color: orange,
                          icon: sleepAndBreak,
                          selected: state.enabledIcon == IconsAndNames.sleepAndBreak,
                          enabled: !(state.enabledIcon == IconsAndNames.sleepAndBreak),
                          onTap: () {
                            context.read<DrivingCubit>().setEnabledButton(button: IconsAndNames.sleepAndBreak);

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
                          selected: state.enabledIcon == IconsAndNames.service,
                          enabled: !(state.enabledIcon == IconsAndNames.service),
                          onTap: () {
                            context.read<DrivingCubit>().setEnabledButton(button: IconsAndNames.service);

                            print('service');
                          },
                        ),
                        ButtonWithIcon(
                          text: 'Other',
                          color: blue,
                          icon: otherWork,
                          selected: state.enabledIcon == IconsAndNames.otherWork,
                          enabled: !(state.enabledIcon == IconsAndNames.otherWork),
                          onTap: () {
                            context.read<DrivingCubit>().setEnabledButton(button: IconsAndNames.otherWork);

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
                      selected: state.enabledIcon == IconsAndNames.driving,
                      enabled: !(state.enabledIcon == IconsAndNames.driving),
                      onTap: () {
                        context.read<DrivingCubit>().setEnabledButton(button: IconsAndNames.driving);

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
        },
      ),
    );
  }
}
