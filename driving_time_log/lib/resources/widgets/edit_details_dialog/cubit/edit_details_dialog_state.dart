part of 'edit_details_dialog_cubit.dart';

class EditDetailsDialogState {
  final bool busy;

  const EditDetailsDialogState({
    this.busy = false,
  });

  EditDetailsDialogState copyWith({
    bool? busy,
  }) =>
      EditDetailsDialogState(
        busy: busy ?? this.busy,
      );
}
