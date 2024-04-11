import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:his_mobile/data/models/user_models/emergency_contact_model.dart';
import 'package:his_mobile/domain/entities/address_entity.dart';

part 'user_entity.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String inn,
    required String citizenship,
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
}
