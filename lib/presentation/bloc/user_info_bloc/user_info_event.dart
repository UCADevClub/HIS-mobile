part of 'user_info_bloc.dart';

@immutable
abstract class UserInfoEvent {}

class UserInfoLoad extends UserInfoEvent {}

class UserInfoUpdate extends UserInfoEvent {
  final User user;

  UserInfoUpdate(this.user);
}

class ToggleUserInfoUpdate extends UserInfoEvent {
  final bool isUpdating;

  ToggleUserInfoUpdate(this.isUpdating);
}

class UserInfoErrorEvent extends UserInfoEvent {
  final String message;

  UserInfoErrorEvent(this.message);
}
