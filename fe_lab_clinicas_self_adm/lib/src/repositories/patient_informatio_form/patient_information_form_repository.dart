import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_adm/src/models/patiente_information_form_model.dart';

abstract interface class PatientInformationFormRepository {
  Future<Either<RepositoryException, PatientInformationFormModel?>>
      callNextToCheckcin();
  Future<Either<RepositoryException, Unit>> updateStatus(
      String id, PatientInformationFormStatus status);
}
