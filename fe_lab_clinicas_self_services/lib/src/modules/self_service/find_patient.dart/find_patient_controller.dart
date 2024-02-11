import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service/src/repository/patients/patient_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FindPatientController with MessageStateMixin {
  FindPatientController({
    required PatientRepository patientRepository,
  }) : _patientRepository = patientRepository;

  final PatientRepository _patientRepository;
  final _patientNotFound = ValueSignal<bool?>(null);
  final _patientFind = ValueSignal<PatientModel?>(null);

  PatientModel? get patientFind => _patientFind();
  bool? get patientNotFound => _patientNotFound();

  Future<void> findPatientByDocument(String document) async {
    final patientResult =
        await _patientRepository.findPatientByDocument(document);

    bool patientNotFound;
    PatientModel? patientFind;

    switch (patientResult) {
      case Right(value: PatientModel model?):
        patientNotFound = false;
        patientFind = model;
      case Right(value: _):
        patientNotFound = true;
        patientFind = null;
      case Left():
        showError("Error ao bsucar paciente");
        return;
    }

    batch(() {
      _patientFind.forceUpdate(patientFind);
      _patientNotFound.forceUpdate(patientNotFound);
    });
  }

  void continueWithoutDocument() {
    batch(() {
      _patientFind.value = null;
      _patientNotFound.forceUpdate(false);
    });
  }
}
