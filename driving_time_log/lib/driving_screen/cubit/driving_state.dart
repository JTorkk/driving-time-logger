part of 'driving_cubit.dart';

class DrivingState {
  final bool busy;
  final IconsAndNames enabledIcon;

  const DrivingState({
    this.busy = false,
    this.enabledIcon = IconsAndNames.out,
  });

  DrivingState copyWith({
    bool? busy,
    IconsAndNames? enabledIcon,
  }) =>
      DrivingState(
        busy: busy ?? this.busy,
        enabledIcon: enabledIcon ?? this.enabledIcon,
      );
}
