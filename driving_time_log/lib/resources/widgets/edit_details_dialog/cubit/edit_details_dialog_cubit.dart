import 'package:bloc/bloc.dart';
import 'package:driving_time_log/resources/maps_Lists_enums.dart';

part 'edit_details_dialog_state.dart';

class EditDetailsDialogCubit extends Cubit<EditDetailsDialogState> {
  EditDetailsDialogCubit({IconsAndNames? icon}) : super(EditDetailsDialogState(enabledIcon: icon));

  void setEnabledButton({required IconsAndNames button}) async {
    emit(state.copyWith(enabledIcon: button));
  }
}
