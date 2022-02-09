import 'package:driving_time_log/main.dart';
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
}) {
  var _date = dateTimeToDDMMYYYY(date ?? DateTime.now());
  var box = Hive.box<List>(logBox);
  var data = box.get(_date)![index];

  return showDialog(
    context: context,
    builder: (context) {
      var theme = Theme.of(context).textTheme;

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
                        _TypeButton(type: 'driving', state: state),
                        const SizedBox(width: 10),
                        _TypeButton(type: 'service', state: state),
                        const SizedBox(width: 10),
                        _TypeButton(type: 'otherWork', state: state),
                        const SizedBox(width: 10),
                        _TypeButton(type: 'sleepAndBreak', state: state),
                        const SizedBox(width: 10),
                        _TypeButton(type: 'out', state: state),
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

                  //TODO: add deletion confirmation
                  //TODO: now clears the whole day make possible to clear only from the index pressed if in between things add ? box with th same time if last add on coing ? box
                  //TODO: use inex to point to right one
                  IconButton(
                    icon: const Icon(
                      Icons.remove_circle,
                    ),
                    onPressed: () {
                      box.delete(_date);
                      Navigator.pop(context);

                      // data.delete[index];
                      print('deleted data from $_date');
                    },
                  )
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

class _TypeButton extends StatelessWidget {
  final String type;
  final EditDetailsDialogState state;

  const _TypeButton({
    Key? key,
    required this.type,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iconType = iconEnum[type];
    return GestureDetector(
      onTap: state.enabledIcon == iconType
          ? null
          : () {
              context.read<EditDetailsDialogCubit>().setEnabledButton(button: iconType!);
            },
      child: SvgIcon(
        assetName: iconPaths[type],
        size: 25,
        color: state.enabledIcon == iconType ? iconColors[type] : white,
      ),
    );
  }
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
          //TODO: !!maybe!! move to its own file and add cubit to handle text editing
          Text(
            desc ? dataKey : '${data[dataKey]}',
            style: textTheme.bodyText1?.copyWith(color: white.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
