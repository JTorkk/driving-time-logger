part of 'archive_cubit.dart';

class ArchiveState {
  final bool busy;
  final DateTime? focusedDay;
  final DateTime? selectedDay;

  const ArchiveState({
    this.busy = false,
    this.focusedDay,
    this.selectedDay,
  });

  ArchiveState copyWith({
    bool? busy,
    DateTime? focusedDay,
    DateTime? selectedDay,
  }) =>
      ArchiveState(
        busy: busy ?? this.busy,
        focusedDay: focusedDay ?? this.focusedDay,
        selectedDay: selectedDay ?? this.selectedDay,
      );
}
