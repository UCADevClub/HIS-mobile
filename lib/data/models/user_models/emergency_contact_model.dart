import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:his_mobile/data/models/user_models/address_model.dart';

part 'emergency_contact_model.freezed.dart';
part 'emergency_contact_model.g.dart';

@freezed
class EmergencyContact with _$EmergencyContact {
  const factory EmergencyContact({
    required String firstName,
    String? middleName,
    required String lastName,
    required String phoneNumber,
    required Address address,
  }) = _EmergencyContact;

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactFromJson(json);
}
