import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service/src/repository/patients/patient_repository.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import '../self_service_controller.dart';

class PatientController with MessageStateMixin {
  PatientController({
    required PatientRepository repository,
  }) : _repository = repository;

  final PatientRepository _repository;
  PatientModel? patient;
  final controller = Injector.get<SelfServiceController>();

  final _nextStep = signal<bool>(false);
  final _saveOk = signal<bool>(false);

  bool get nextStep => _nextStep();
  bool get saveOk => _saveOk();

  void goNextStep() {
    _nextStep.value = true;
  }

  void saveAndNextOk() {
    _saveOk.value = true;
  }

  Future<void> updateAndNext(PatientModel model) async {
    final updateResult = await _repository.update(model);

    switch (updateResult) {
      case Left():
        showError("Erro ao atualizar paciente, chame o atendente.");
      case Right():
        showinfo("Pacinete atualizado com sucesso.");
        patient = model;
        goNextStep();
    }
  }

  Future<void> saveAndNext(RegisterPatientModel registerPatientModel) async {
    final result = await _repository.register(registerPatientModel);

    switch (result) {
      case Left():
        showError("Erro ao cadastrar paciente, chame o atendente");
      case Right():
        showinfo("Paciente cadastrado com Sucesso");
        patient = result.value;
        saveAndNextOk();
    }
  }
}
