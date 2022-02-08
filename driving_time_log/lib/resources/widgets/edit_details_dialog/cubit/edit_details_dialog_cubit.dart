import 'package:bloc/bloc.dart';

part 'edit_details_dialog_state.dart';

class EditDetailsDialogCubit extends Cubit<EditDetailsDialogState> {
  EditDetailsDialogCubit() : super(const EditDetailsDialogState());

  void setEnabledButton() async {
    //  emit(state.copyWith(enabledIcon: button));
  }
}
