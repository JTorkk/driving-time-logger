import 'package:driving_time_log/resources/colors.dart';
import 'package:driving_time_log/resources/widgets/current_days_logs.dart';
import 'package:driving_time_log/resources/widgets/edit_details_dialog.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return SafeArea(
      bottom: false,
      right: false,
      left: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2022, 1, 1),
              lastDay: DateTime.now(),
              focusedDay: DateTime.now(),
              availableCalendarFormats: const {CalendarFormat.month: 'Month'},
              startingDayOfWeek: StartingDayOfWeek.monday,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  //TODO: adapt to the chhosen day
                  "20.2.2022 logs:",
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
