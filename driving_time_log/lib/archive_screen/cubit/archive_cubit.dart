import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'archive_state.dart';

class ArchiveCubit extends Cubit<ArchiveState> {
  ArchiveCubit() : super(ArchiveInitial());
}
