import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_entity.freezed.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required String country,
    required String oblast,
    required String cityVillage,
    required String street,
    required String house,
    String? apartment,
    required String postalCode,
  }) = _Address;
}
