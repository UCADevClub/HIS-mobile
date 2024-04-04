part of 'user_info_bloc.dart';

@immutable
abstract class UserInfoState {}

class UserInfoInitial extends UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UserInfoLoaded extends UserInfoState {
  final User user;

  UserInfoLoaded(this.user);
}

class UserInfoUpdating extends UserInfoState {
  final bool isUpdating;

  UserInfoUpdating(this.isUpdating);
}

class UserInfoUpdated extends UserInfoState {
  final User user;

  UserInfoUpdated(this.user);
}

class UserInfoError extends UserInfoState {
  final String message;

  UserInfoError(this.message);
}
