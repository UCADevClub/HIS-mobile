import 'package:bloc/bloc.dart';
import 'package:his_mobile/data/datasources/user_datasource.dart';
import 'package:his_mobile/presentation/bloc/user_info_bloc/user_info_event.dart';
import 'package:his_mobile/presentation/bloc/user_info_bloc/user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final UserDataSource userDataSource;

  UserInfoBloc(this.userDataSource) : super(UserInfoInitial()) {
    on<UserInfoEvent>((event, emit) {});
    on<ToggleUserInfoUpdate>((event, emit) {
      emit(UserInfoUpdating(event.isUpdating));
    });
    on<UserInfoLoad>(_onProfileViewed);
  }

  Future<void> _onProfileViewed(
    UserInfoLoad event,
    Emitter<UserInfoState> emit,
  ) async {
    try {
      final userInfo = await userDataSource.getUserDetails();
      emit(
        UserInfoLoaded(userInfo),
      );
    } catch (e) {
      emit(
        UserInfoError(e.toString()),
      );
    }
  }
}
