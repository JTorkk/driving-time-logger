import 'package:bloc/bloc.dart';
import 'package:driving_time_log/main.dart';
import 'package:driving_time_log/resources/date_functions.dart';
import 'package:driving_time_log/resources/maps_Lists_enums.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'driving_state.dart';

class DrivingCubit extends Cubit<DrivingState> {
  DrivingCubit() : super(const DrivingState());

  void setEnabledButton({required IconsAndNames button}) async {
    emit(state.copyWith(enabledIcon: button));
  }

  void buttonPressed({required IconsAndNames button}) async {
    var box = Hive.box<List>(log);

    Map<String, dynamic> _out = {
      'type': enumIcon[button],
      'startTime': dateTimeToHHMM(DateTime.now()),
      //TODO: make null defaults work
      'endTime': '00:00',
      'startKm': '120 000',
      'endKm': '120 135',
      'vehicleTag': 'ABC-123',
      'description': 'testi'
    };
    var _testList = [_out];

    var _currentData = box.get(dateTimeToDDMMYYYY(DateTime.now()));

    if (_currentData == null) {
      box.put(dateTimeToDDMMYYYY(DateTime.now()), _testList);
    } else {
      var dataIndex = _currentData.length - 1;

      _currentData[dataIndex]['endTime'] = dateTimeToHHMM(DateTime.now());

      box.put(dateTimeToDDMMYYYY(DateTime.now()), _currentData + _testList);
    }

    //TODO: create new log event
    // emit(state.copyWith(enabledIcon: button));
  }
}
