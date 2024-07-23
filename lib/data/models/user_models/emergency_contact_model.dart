import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:his_mobile/data/models/user_models/address_model.dart';

part 'emergency_contact_model.freezed.dart';
part 'emergency_contact_model.g.dart';

@freezed
class EmergencyContact with _$EmergencyContact {
  const factory EmergencyContact({
    required int id,
    required String first_name,
    String? middle_name,
    required String last_name,
    required String phone_number,
  }) = _EmergencyContact;

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactFromJson(json);
}
