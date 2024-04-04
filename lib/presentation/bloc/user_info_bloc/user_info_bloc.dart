import 'package:bloc/bloc.dart';
import 'package:his_mobile/domain/entities/user_entities/user_entity.dart';
import 'package:meta/meta.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc() : super(UserInfoInitial()) {
    on<UserInfoEvent>((event, emit) {});
    on<ToggleUserInfoUpdate>((event, emit) {
      emit(UserInfoUpdating(event.isUpdating));
    });
    on<UserInfoUpdate>((event, emit) {
      emit(UserInfoUpdated(event.user));
    });
  }
}
