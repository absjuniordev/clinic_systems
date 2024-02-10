// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:asyncstate/asyncstate.dart' as asyncstate;
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_adm/src/models/patiente_information_form_model.dart';

import 'package:fe_lab_clinicas_self_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:fe_lab_clinicas_self_adm/src/services/call_next_patient/call_next_patient_service.dart';
import 'package:signals_flutter/signals_flutter.dart';

class HomeController with MessageStateMixin {
  HomeController({
    required AttendantDeskAssignmentRepository
        attendantDeskAssignmentRepository,
    required CallNextPatientService callNextPatientService,
  })  : _attendantDeskAssignmentRepository = attendantDeskAssignmentRepository,
        _callNextPatientService = callNextPatientService;

  final AttendantDeskAssignmentRepository _attendantDeskAssignmentRepository;
  final CallNextPatientService _callNextPatientService;
  final _iformationForm = signal<PatientInformationFormModel?>(null);

  PatientInformationFormModel? get iformationForm => _iformationForm();

  Future<void> startService(int deskNumber) async {
    asyncstate.AsyncState.show();
    final result =
        await _attendantDeskAssignmentRepository.startService(deskNumber);

    switch (result) {
      case Left():
        asyncstate.AsyncState.hide();
        log('Erro ao iniciar Guichê');
      case Right():
        final resultNextPatient = await _callNextPatientService.execute();
        switch (resultNextPatient) {
          case Left():
            showError('Erro ao chamar o proximo paciente');
          case Right(value: final form?):
            asyncstate.AsyncState.hide();
            _iformationForm.value = form;
          case Right(value: _):
            asyncstate.AsyncState.hide();
            showinfo('Nenhum paciente aguardando');
        }
    }
  }
}
