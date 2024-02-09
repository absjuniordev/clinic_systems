import 'dart:developer';

import 'package:asyncstate/asyncstate.dart' as asyncstate;
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';

class HomeController with MessageStateMixin {
  HomeController({
    required AttendantDeskAssignmentRepository
        attendantDeskAssignmentRepository,
  }) : _attendantDeskAssignmentRepository = attendantDeskAssignmentRepository;

  final AttendantDeskAssignmentRepository _attendantDeskAssignmentRepository;

  Future<void> startService(int deskNumber) async {
    asyncstate.AsyncState.show();
    final result =
        await _attendantDeskAssignmentRepository.startService(deskNumber);

    switch (result) {
      case Left():
        asyncstate.AsyncState.hide();
        log('Erro ao iniciar Guichê');
      case Right():
        asyncstate.AsyncState.hide();
        showinfo('Registrou com sucesso');
    }
  }
}
