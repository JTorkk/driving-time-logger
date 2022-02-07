import 'package:bloc/bloc.dart';
import 'package:driving_time_log/resources/maps_Lists_enums.dart';
import 'package:flutter/foundation.dart';

part 'driving_state.dart';

class DrivingCubit extends Cubit<DrivingState> {
  DrivingCubit() : super(const DrivingState());

  void setEnabledButton({required IconsAndNames button}) async {
    emit(state.copyWith(enabledIcon: button));
  }

  void buttonPressed({required IconsAndNames button}) async {
    if (kDebugMode) {
      print(button.toString().substring(14));
    }
    //TODO: create new log event
    // emit(state.copyWith(enabledIcon: button));
  }
}
