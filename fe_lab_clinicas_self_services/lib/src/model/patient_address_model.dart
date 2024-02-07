import 'package:json_annotation/json_annotation.dart';

part 'patient_address_model.g.dart';

@JsonSerializable()
class PatientAddressModel {
  PatientAddressModel({
    required this.cep,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.district,
  });

  final String cep;
  @JsonKey(name: 'street_address')
  final String streetAddress;
  final String city;
  final String state;
  final String district;

  factory PatientAddressModel.fromJson(Map<String, dynamic> json) =>
      _$PatientAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAddressModelToJson(this);
}
