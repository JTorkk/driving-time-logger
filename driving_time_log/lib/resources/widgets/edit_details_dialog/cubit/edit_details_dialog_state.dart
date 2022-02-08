part of 'edit_details_dialog_cubit.dart';

class EditDetailsDialogState {
  final bool busy;
  final IconsAndNames? enabledIcon;

  const EditDetailsDialogState({
    this.busy = false,
    this.enabledIcon,
  });

  EditDetailsDialogState copyWith({
    bool? busy,
    IconsAndNames? enabledIcon,
  }) =>
      EditDetailsDialogState(
        busy: busy ?? this.busy,
        enabledIcon: enabledIcon ?? this.enabledIcon,
      );
}
