import 'package:driving_time_log/main.dart';
import 'package:driving_time_log/resources/assets.dart';
import 'package:driving_time_log/resources/colors.dart';
import 'package:driving_time_log/resources/date_functions.dart';
import 'package:driving_time_log/resources/maps_Lists_enums.dart';
import 'package:driving_time_log/resources/widgets/edit_details_dialog/edit_details_dialog.dart';
import 'package:driving_time_log/resources/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CurrentDayLogs extends StatelessWidget {
  final DateTime day;
  //TODO: Take day as parameter and search for the logs of that day
  //TODO: think about does this need cubit
  //TODO: listen databse chages always

  const CurrentDayLogs({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _date = dateTimeToDDMMYYYY(day);
    return Expanded(
      //TODO: move the list so that the bottomest one is the newest and all the older are above
      child: ValueListenableBuilder(
        //TODO: toimisko lazt boxina jos kuunnellaan vain päivän keytä

        valueListenable: Hive.box<List>(log).listenable(),
        builder: (context, Box<List> box, _) {
          var theme = Theme.of(context).textTheme;
          if (box.values.isEmpty || box.get(_date) == null) {
            return Center(
              child: Text('No Logs', style: theme.bodyText1),
            );
          }
          return ListView.builder(
            itemCount: box.get(_date)?.length,
            itemBuilder: (context, index) {
              Map? _currentDay = box.get(_date)?[index];
              var _icon = _currentDay!['type'].toString();

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
                        assetName: iconPaths[_icon],
                        size: 40,
                        color: iconColors[_icon],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Duration:', style: theme.bodyText2),
                          Text(duration(_currentDay['startTime'], _currentDay['endTime']), style: theme.bodyText2),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //TODO: null checks or make reading functions when works
                          Text('Start: ${_currentDay['startTime']}', style: theme.bodyText2),
                          Text('End:   ${_currentDay['endTime']}', style: theme.bodyText2),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          print(_currentDay.toString());

                          //TODO: enable
                          detailsDialog(context: context, date: day, index: index);
                        },
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
