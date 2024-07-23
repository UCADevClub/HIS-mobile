import 'package:equatable/equatable.dart';
import 'package:his_mobile/data/models/user_models/user_model.dart';

abstract class UserInfoEvent extends Equatable {
  const UserInfoEvent();

  @override
  List<Object> get props => [];
}

class UserInfoLoad extends UserInfoEvent {}

class UserInfoUpdate extends UserInfoEvent {
  final User user;

  const UserInfoUpdate(this.user);

  @override
  List<Object> get props => [user];
}

class ToggleUserInfoUpdate extends UserInfoEvent {
  final bool isUpdating;

  const ToggleUserInfoUpdate(this.isUpdating);

  @override
  List<Object> get props => [isUpdating];
}

class UserInfoErrorEvent extends UserInfoEvent {
  final String message;

  const UserInfoErrorEvent(this.message);

  @override
  List<Object> get props => [message];
}
