import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:his_mobile/domain/entities/user_entities/address_entity.dart';
import 'package:his_mobile/domain/entities/user_entities/emergency_contact_entity.dart';

part 'user_entity.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String inn,
    required String email,
    required String firstName,
    required String lastName,
    String? middleName,
    required String dateOfBirth,
    required String gender,
    required String phoneNumber,
    required Address address,
    required String maritalStatus,
    required EmergencyContact primaryEmergencyContact,
    required EmergencyContact secondaryEmergencyContact,
  }) = _User;
}
