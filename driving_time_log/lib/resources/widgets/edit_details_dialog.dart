import 'package:driving_time_log/resources/assets.dart';
import 'package:driving_time_log/resources/colors.dart';
import 'package:driving_time_log/resources/maps_Lists_enums.dart';
import 'package:driving_time_log/resources/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

Future<dynamic> detailsDialog({
  required BuildContext context,
  //TODO tak document id or smthg as parameter if empty create new documetn

  //TODO: cubit stuff needs to be added
}) {
  return showDialog(
    context: context,
    builder: (context) {
      var theme = Theme.of(context).textTheme;
      var widht = 120.0;
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
                      onTap: () {},
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
                  //TODO: the chooosen is colored
                  //TODO: make this button/picker
                  SvgIcon(assetName: driving, size: 25, color: iconColors['driving']),
                  const SizedBox(width: 10),
                  const SvgIcon(assetName: service, size: 25),
                  const SizedBox(width: 10),
                  const SvgIcon(assetName: otherWork, size: 25),
                  const SizedBox(width: 10),
                  const SvgIcon(assetName: sleepAndBreak, size: 25),
                  const SizedBox(width: 10),
                  const SvgIcon(assetName: out, size: 25),
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
                    '12:35',
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
                    '13:45',
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
                    '120 000',
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
                    '120 200',
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
                    '1h 10min',
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
                      'vehicle tag',
                      style: theme.bodyText1,
                    ),
                  ),

                  Text(
                    'ABC-123',
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
  );
}
