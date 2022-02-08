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
  int index = 0, //TODO: is this ok to always defautl zero <-- it is if creating new entry takes first one
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

                  //TODO: custom keyboard to add : automatically
                  //TODO: default to the current time if empty??
                  _DataEntry(text: 'Start time', dataKey: 'startTime', textTheme: theme, data: data),

                  //       //TODO: custom keyboard to add : automatically
                  _DataEntry(text: 'End time', dataKey: 'endTime', textTheme: theme, data: data),

                  if (data['type'] == 'driving')
                    //       //TODO: number keyboard
                    _DataEntry(text: 'Start km', dataKey: 'startKm', textTheme: theme, data: data),

                  if (data['type'] == 'driving')
                    //TODO: number keyboard
                    _DataEntry(text: 'End km', dataKey: 'endKm', textTheme: theme, data: data),

                  //TODO: no need to edit manually
                  _DataEntry(
                      text: 'Duration', dataKey: duration(data['startTime'], data['endTime']), textTheme: theme, data: data, desc: true),

                  if (data['type'] == 'driving')
                    //       //TODO: custom keyboard to add - automatically
                    //         //TODO: why does this return null
                    _DataEntry(text: 'Vehicle tag', dataKey: 'VehicleTag', textTheme: theme, data: data),

                  //       //TODO: normal keyboard
                  _DataEntry(text: 'Description', dataKey: 'description', textTheme: theme, data: data, last: true),

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

//TODO: handle different keyboards
class _DataEntry extends StatelessWidget {
  final String text;
  final String dataKey;
  final TextTheme textTheme;
  final dynamic data;
  final bool last;
  final bool desc;
  //TODO: add input type enum so right keyboard can be choosen
  const _DataEntry(
      {Key? key,
      required this.text,
      required this.dataKey,
      required this.textTheme,
      required this.data,
      this.last = false,
      this.desc = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.only(bottom: 16),
      decoration: last
          ? null
          : const BoxDecoration(
              border: Border(bottom: BorderSide(color: accent, width: 2)),
            ),
      child: Row(
        children: [
          Container(
            constraints: const BoxConstraints(
              minWidth: 120,
            ),
            child: Text(
              text,
              style: textTheme.bodyText1,
            ),
          ),
          //TODO: maybe move to its own file and add cubit to handle text editing
          Text(
            desc ? dataKey : '${data[dataKey]}',
            style: textTheme.bodyText1?.copyWith(color: white.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
