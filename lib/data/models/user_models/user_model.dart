import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:his_mobile/data/models/user_models/address_model.dart';
import 'package:his_mobile/data/models/user_models/emergency_contact_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String user_id,
    required String first_name,
    required String last_name,
    String? middle_name,
    required String email,
    required String citizenship,
    String? date_of_birth,
    required String phone_number,
    String? gender,
    required Address address,
    required EmergencyContact primary_emergency_contact,
    required EmergencyContact secondary_emergency_contact,
    String? marital_status,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
