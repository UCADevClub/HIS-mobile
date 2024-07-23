import 'package:equatable/equatable.dart';
import 'package:his_mobile/data/models/user_models/user_model.dart';

abstract class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

class UserInfoInitial extends UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UserInfoLoaded extends UserInfoState {
  final User user;
  final bool isEditing;

  const UserInfoLoaded(this.user, {this.isEditing = false});

  @override
  List<Object> get props => [
        user,
        isEditing,
      ];
}

class UserInfoUpdating extends UserInfoState {
  final bool isUpdating;

  const UserInfoUpdating(this.isUpdating);

  @override
  List<Object> get props => [isUpdating];
}

class UserInfoError extends UserInfoState {
  final String message;

  const UserInfoError(this.message);

  @override
  List<Object> get props => [message];
}
