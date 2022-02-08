import 'package:bloc/bloc.dart';
import 'package:driving_time_log/resources/date_functions.dart';
import 'package:table_calendar/table_calendar.dart';

part 'archive_state.dart';

class ArchiveCubit extends Cubit<ArchiveState> {
  ArchiveCubit() : super(const ArchiveState());

  bool selectedDayPredicate(day) {
    return isSameDay(state.selectedDay, day);
  }

  void onDateSelected(selectedDay, focusedDay) async {
    if (!isSameDay(state.selectedDay, selectedDay)) {
      emit(state.copyWith(
        selectedDay: selectedDay,
        focusedDay: focusedDay,
      ));
    }
  }

  String getDateText() {
    if (isSameDay(state.selectedDay, DateTime.now())) {
      return "Today's";
    } else {
      return dateTimeToDDMMYYYY(state.selectedDay ?? DateTime.now());
    }
  }
}
