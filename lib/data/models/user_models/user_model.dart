import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:his_mobile/data/models/user_models/address_model.dart';
import 'package:his_mobile/data/models/user_models/emergency_contact_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String inn,
    required String email,
    required String firstName,
    required String lastName,
    String? middleName,
    String? dateOfBirth,
    String? gender,
    required String phoneNumber,
    required Address address,
    String? maritalStatus,
    required EmergencyContact primaryEmergencyContact,
    required EmergencyContact secondaryEmergencyContact,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
