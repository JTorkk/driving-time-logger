import 'package:driving_time_log/main.dart';
import 'package:driving_time_log/resources/assets.dart';
import 'package:driving_time_log/resources/colors.dart';
import 'package:driving_time_log/resources/date_functions.dart';
import 'package:driving_time_log/resources/maps_Lists_enums.dart';
import 'package:driving_time_log/resources/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cubit/edit_details_dialog_cubit.dart';

Future<dynamic> detailsDialog({
  required BuildContext context,
  DateTime? date,
  int index = 0, //TODO: is this ok to always defautl zero
  //TODO: if date is null create new log else edit details
  //TODO: handle editing
  //TODO: hide unneccesary field for every type
}) {
  var _date = dateTimeToDDMMYYYY(date ?? DateTime.now());
  var data = Hive.box<List>(log).get(_date)![index];

  return showDialog(
    context: context,
    builder: (context) {
      var theme = Theme.of(context).textTheme;
      var widht = 120.0;
      return BlocProvider(
        create: (context) => EditDetailsDialogCubit(icon: iconEnum[data['type']]),
        child: BlocBuilder<EditDetailsDialogCubit, EditDetailsDialogState>(
          builder: (context, state) {
            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 16,
              backgroundColor: bgColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: accent,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'cancel',
                            style: theme.bodyText1?.copyWith(color: accentblue),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: accentblue, //TODO: cnahge color to greyish if nothing has chaged
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Text(
                                'Done',
                                style: theme.bodyText1,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    padding: const EdgeInsets.only(bottom: 16),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: accent, width: 2)),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Type',
                          style: theme.bodyText1,
                        ),
                        const SizedBox(width: 20),
                        //TODO: make neater sub widget

                        GestureDetector(
                          onTap: state.enabledIcon == IconsAndNames.driving
                              ? null
                              : () {
                                  context.read<EditDetailsDialogCubit>().setEnabledButton(button: IconsAndNames.driving);
                                },
                          child: SvgIcon(
                            assetName: driving,
                            size: 25,
                            color: state.enabledIcon == IconsAndNames.driving ? iconColors['driving'] : white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: state.enabledIcon == IconsAndNames.service
                              ? null
                              : () {
                                  context.read<EditDetailsDialogCubit>().setEnabledButton(button: IconsAndNames.service);
                                },
                          child: SvgIcon(
                            assetName: service,
                            size: 25,
                            color: state.enabledIcon == IconsAndNames.service ? iconColors['service'] : white,
                          ),
                        ),
                        // const SvgIcon(assetName: service, size: 25),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: state.enabledIcon == IconsAndNames.otherWork
                              ? null
                              : () {
                                  context.read<EditDetailsDialogCubit>().setEnabledButton(button: IconsAndNames.otherWork);
                                },
                          child: SvgIcon(
                            assetName: otherWork,
                            size: 25,
                            color: state.enabledIcon == IconsAndNames.otherWork ? iconColors['otherWork'] : white,
                          ),
                        ),
                        // const SvgIcon(assetName: otherWork, size: 25),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: state.enabledIcon == IconsAndNames.sleepAndBreak
                              ? null
                              : () {
                                  context.read<EditDetailsDialogCubit>().setEnabledButton(button: IconsAndNames.sleepAndBreak);
                                },
                          child: SvgIcon(
                            assetName: sleepAndBreak,
                            size: 25,
                            color: state.enabledIcon == IconsAndNames.sleepAndBreak ? iconColors['sleepAndBreak'] : white,
                          ),
                        ),
                        // const SvgIcon(assetName: sleepAndBreak, size: 25),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: state.enabledIcon == IconsAndNames.out
                              ? null
                              : () {
                                  context.read<EditDetailsDialogCubit>().setEnabledButton(button: IconsAndNames.out);
                                },
                          child: SvgIcon(
                            assetName: out,
                            size: 25,
                            color: state.enabledIcon == IconsAndNames.out ? iconColors['out'] : white,
                          ),
                        ),
                        // const SvgIcon(assetName: out, size: 25),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    padding: const EdgeInsets.only(bottom: 16),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: accent, width: 2)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            minWidth: widht,
                          ),
                          child: Text(
                            'Start time',
                            style: theme.bodyText1,
                          ),
                        ),

                        //TODO: custom keyboard to add : automatically
                        //TODO: default to the current time if empty??
                        Text(
                          '${data['startTime']}',
                          style: theme.bodyText1?.copyWith(color: white.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    padding: const EdgeInsets.only(bottom: 16),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: accent, width: 2)),
                    ),
                    child: Row(
                      children: [
                        //TODO: custom keyboard to add : automatically
                        Container(
                          constraints: BoxConstraints(
                            minWidth: widht,
                          ),
                          child: Text(
                            'End time',
                            style: theme.bodyText1,
                          ),
                        ),

                        Text(
                          '${data['endTime']}',
                          style: theme.bodyText1?.copyWith(color: white.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                  if (data['type'] == 'driving')
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      padding: const EdgeInsets.only(bottom: 16),
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: accent, width: 2)),
                      ),
                      child: Row(
                        children: [
                          //TODO: number keyboard
                          Container(
                            constraints: BoxConstraints(
                              minWidth: widht,
                            ),
                            child: Text(
                              'Start km',
                              style: theme.bodyText1,
                            ),
                          ),

                          Text(
                            '${data['startKm']}',
                            style: theme.bodyText1?.copyWith(color: white.withOpacity(0.5)),
                          ),
                        ],
                      ),
                    ),
                  if (data['type'] == 'driving')
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      padding: const EdgeInsets.only(bottom: 16),
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: accent, width: 2)),
                      ),
                      child: Row(
                        children: [
                          //TODO: number keyboard
                          Container(
                            constraints: BoxConstraints(
                              minWidth: widht,
                            ),
                            child: Text(
                              'End km',
                              style: theme.bodyText1,
                            ),
                          ),

                          Text(
                            '${data['endKm']}',
                            style: theme.bodyText1?.copyWith(color: white.withOpacity(0.5)),
                          ),
                        ],
                      ),
                    ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    padding: const EdgeInsets.only(bottom: 16),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: accent, width: 2)),
                    ),
                    child: Row(
                      children: [
                        //TODO: no need to edit manually
                        Container(
                          constraints: BoxConstraints(
                            minWidth: widht,
                          ),
                          child: Text(
                            'Duration',
                            style: theme.bodyText1,
                          ),
                        ),

                        Text(
                          duration(data['startTime'], data['endTime']),
                          style: theme.bodyText1?.copyWith(color: white.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                  if (data['type'] == 'driving')
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      padding: const EdgeInsets.only(bottom: 16),
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: accent, width: 2)),
                      ),
                      child: Row(
                        children: [
                          //TODO: custom keyboard to add - automatically
                          Container(
                            constraints: BoxConstraints(
                              minWidth: widht,
                            ),
                            child: Text(
                              'Vehicle tag',
                              style: theme.bodyText1,
                            ),
                          ),

                          Text(
                            //TODO: wgy does this return null
                            '${data['VehicleTag']}',
                            style: theme.bodyText1?.copyWith(color: white.withOpacity(0.5)),
                          ),
                        ],
                      ),
                    ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        //TODO: custom keyboard to add - automatically
                        Container(
                          constraints: BoxConstraints(
                            minWidth: widht,
                          ),
                          child: Text(
                            'Description',
                            style: theme.bodyText1,
                          ),
                        ),

                        Text(
                          '${data['description']}',
                          style: theme.bodyText1?.copyWith(color: white.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                  //TODO: add remove log button here
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
