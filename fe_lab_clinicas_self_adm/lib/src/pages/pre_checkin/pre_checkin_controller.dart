import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_adm/src/models/patiente_information_form_model.dart';

import 'package:fe_lab_clinicas_self_adm/src/services/call_next_patient/call_next_patient_service.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PreCheckinController with MessageStateMixin {
  PreCheckinController({
    required CallNextPatientService callNextPatientService,
  }) : _callNextPatientService = callNextPatientService;

  final CallNextPatientService _callNextPatientService;

  final informationForm = signal<PatientInformationFormModel?>(null);
  Future<void> next() async {
    final result = await _callNextPatientService.execute();
    switch (result) {
      case Left():
        showError('Erro ao chamar Paciente');
      case Right(value: final form?):
        informationForm.value = form;
      case Right():
        showinfo('Nenhum paciente aguardando');
    }
  }
}


///aula 14