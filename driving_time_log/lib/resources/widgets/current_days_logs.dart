import 'package:driving_time_log/resources/assets.dart';
import 'package:driving_time_log/resources/colors.dart';
import 'package:driving_time_log/resources/maps_Lists_enums.dart';
import 'package:driving_time_log/resources/widgets/edit_details_dialog.dart';
import 'package:driving_time_log/resources/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class CurrentDayLogs extends StatelessWidget {
  //TODO: Take day as parameter and search for the logs of that day
  //TODO: think about does this need cubit
  const CurrentDayLogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //TODO: move the list so that the bottomest one is the newest and all the older are above
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, position) {
          var theme = Theme.of(context).textTheme;

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: const BoxDecoration(
              color: accent,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgIcon(
                    assetName: driving,
                    size: 40,
                    color: iconColors['driving'],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Duration:', style: theme.bodyText1),
                      Text('1h 15min', style: theme.bodyText1),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Start: 12:35', style: theme.bodyText2),
                      Text('End:   13:23', style: theme.bodyText2),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      detailsDialog(context: context);
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
