
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'patient_info_event.dart';
part 'patient_info_state.dart';

class PatientInfoBloc extends Bloc<PatientInfoEvent, PatientInfoState> {
  PatientInfoBloc() : super(PatientInfoInitial()) {
    on<PatientInfoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
