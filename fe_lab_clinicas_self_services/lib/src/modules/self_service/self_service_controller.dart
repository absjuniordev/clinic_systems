// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service/src/model/self_service_model.dart';
import 'package:fe_lab_clinicas_self_service/src/repository/information_form/information_form_repository.dart';

enum FormSteps {
  nome,
  whoIAm,
  findPatient,
  patient,
  documents,
  done,
  restart,
}

class SelfServiceController with MessageStateMixin {
  final InformationFormRepository informationFormRepository;
  SelfServiceController({
    required this.informationFormRepository,
  });

  final _step = ValueSignal(FormSteps.nome);

  var _model = const SelfServiceModel();
  var password = '';

  SelfServiceModel get model => _model;

  FormSteps get step => _step();

  void startProcess() {
    _step.forceUpdate(FormSteps.whoIAm);
  }

  void setWhoIAmDtatStepAndNext(String name, String lastName) {
    _model = _model.copyWith(
      name: () => name,
      lastName: () => lastName,
    );
    _step.forceUpdate(FormSteps.findPatient);
  }

  void clearForm() {
    _model = _model.clear();
  }

  void goToFormPatient(PatientModel? patient) {
    _model = _model.copyWith(patient: () => patient);
    _step.forceUpdate(FormSteps.patient);
  }

  void restartPorcess() {
    _step.forceUpdate(FormSteps.restart);
    clearForm();
  }

  void updatePatientAndGoDocument(PatientModel? patient) {
    _model = _model.copyWith(
      patient: () => patient,
    );
    _step.forceUpdate(FormSteps.documents);
  }

  void registerDocument(DocumentType type, String filePath) {
    final documents = _model.documents ?? {};
    if (type == DocumentType.healthInsuranceCard) {
      documents[type]?.clear();
    }
    final values = documents[type] ?? [];
    values.add(filePath);
    documents[type] = values;
    _model = _model.copyWith(documents: () => documents);
  }

  void clearDocuments() {
    _model = _model.copyWith(documents: () => {});
  }

  Future<void> finalize() async {
    final result =
        await informationFormRepository.register(model).asyncLoader();

    switch (result) {
      case Left():
        showError('Erro ao registrar Atendimento');
      case Right():
        password = '${_model.name} ${_model.lastName}';
        _step.forceUpdate(FormSteps.done);
    }
  }
}
