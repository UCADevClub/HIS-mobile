import 'package:bloc/bloc.dart';
import 'package:his_mobile/domain/entities/user_entity.dart';
import 'package:his_mobile/presentation/bloc/user_info_bloc/user_info_state.dart';
import 'package:meta/meta.dart';

part 'user_info_event.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc() : super(UserInfoInitial()) {
    on<UserInfoEvent>((event, emit) {});
    on<ToggleUserInfoUpdate>((event, emit) {
      emit(UserInfoUpdating(event.isUpdating));
    });
    // on<UserInfoUpdate>((event, emit) {
    //   emit(UserInfoLoaded());
    // });
  }
}
