import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_adm/src/core/env.dart';
import 'package:fe_lab_clinicas_self_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:fe_lab_clinicas_self_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository_impl.dart';
import 'package:fe_lab_clinicas_self_adm/src/repositories/painel/painel_repository.dart';
import 'package:fe_lab_clinicas_self_adm/src/repositories/painel/painel_repository_impl.dart';
import 'package:fe_lab_clinicas_self_adm/src/repositories/patient_informatio_form/patient_information_form_repository.dart';
import 'package:fe_lab_clinicas_self_adm/src/repositories/patient_informatio_form/patient_information_form_repository_impl.dart';
import 'package:fe_lab_clinicas_self_adm/src/services/call_next_patient/call_next_patient_service.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LabClinicasApplicationsBindings extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton(
          (i) => RestClient(Env.backendBaseUrl),
        ),
        Bind.lazySingleton<PatientInformationFormRepository>(
            (i) => PatientInformationFormRepositoryImpl(restClient: i())),
        Bind.singleton<AttendantDeskAssignmentRepository>(
            (i) => AttendantDeskAssignmentRepositoryImpl(restClient: i())),
        Bind.singleton<PainelRepository>(
            (i) => PainelRepositoryImpl(restClient: i())),
        Bind.singleton((i) => CallNextPatientService(
            patientInformationFormRepository: i(),
            attendantDeskAssignmentRepository: i(),
            painelRepository: i()))
      ];
}
