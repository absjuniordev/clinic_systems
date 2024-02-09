import 'package:fe_lab_clinicas_self_adm/src/models/patient_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patiente_information_form_model.g.dart';

@JsonEnum(valueField: 'id')
enum PatientInformationFormStatus {
  waiting('Waiting'),
  checkIn('Check In'),
  beingAttended('Being Attended');

  final String id;
  const PatientInformationFormStatus(
    this.id,
  );
}

@JsonSerializable()
class PatienteInformationFormModel {
  PatienteInformationFormModel({
    required this.id,
    required this.patient,
    required this.healthInsuranceCard,
    required this.medicalOrders,
    required this.password,
    required this.dateCreated,
    required this.status,
  });

  final String id;
  final PatientModel patient;
  @JsonKey(name: 'health_insurance_card')
  final String healthInsuranceCard;
  @JsonKey(name: 'medical_order')
  final List<String> medicalOrders;
  final String password;
  @JsonKey(name: 'date_created')
  final DateTime dateCreated;
  final PatientInformationFormStatus status;

  factory PatienteInformationFormModel.fromJson(Map<String, dynamic> json) =>
      _$PatienteInformationFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatienteInformationFormModelToJson(this);
}