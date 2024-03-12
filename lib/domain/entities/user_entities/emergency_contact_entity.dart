import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:his_mobile/domain/entities/user_entities/address_entity.dart';

part 'emergency_contact_entity.freezed.dart';

@freezed
class EmergencyContact with _$EmergencyContact {
  const factory EmergencyContact({
    required String firstName,
    String? middleName,
    required String lastName,
    required String phoneNumber,
    required Address address,
  }) = _EmergencyContact;
}
