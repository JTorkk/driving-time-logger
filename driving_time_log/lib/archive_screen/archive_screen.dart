import 'package:driving_time_log/archive_screen/cubit/archive_cubit.dart';
import 'package:driving_time_log/resources/colors.dart';
import 'package:driving_time_log/resources/date_time_to.dart';
import 'package:driving_time_log/resources/widgets/current_days_logs.dart';
import 'package:driving_time_log/resources/widgets/edit_details_dialog/edit_details_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => ArchiveCubit(),
      child: BlocBuilder<ArchiveCubit, ArchiveState>(
        builder: (context, state) {
          return SafeArea(
            bottom: false,
            right: false,
            left: false,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TableCalendar(
                    //TODO: runkkaa kalnterin fontit ja värit yms kuntoon
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: theme.bodyText2!,
                      todayDecoration: const BoxDecoration(shape: BoxShape.circle),
                      todayTextStyle: theme.bodyText1!.copyWith(color: red),
                      selectedDecoration: const BoxDecoration(color: accentblue, shape: BoxShape.circle),
                    ),
                    firstDay: DateTime.utc(2022, 1, 1),
                    lastDay: DateTime.now(),
                    focusedDay: state.focusedDay ?? DateTime.now(),
                    selectedDayPredicate: (day) => context.read<ArchiveCubit>().selectedDayPredicate(day),
                    onDaySelected: (selectedDay, focusedDay) => context.read<ArchiveCubit>().onDateSelected(selectedDay, focusedDay),
                    availableCalendarFormats: const {CalendarFormat.month: 'Month'},
                    startingDayOfWeek: StartingDayOfWeek.monday,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        //TODO: adapt to the chhosen day
                        "${context.read<ArchiveCubit>().getDateText()} logs:",
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
                  CurrentDayLogs(day: state.focusedDay ?? DateTime.now()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
