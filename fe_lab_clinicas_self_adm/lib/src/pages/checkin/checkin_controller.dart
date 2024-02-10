import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_adm/src/models/patiente_information_form_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CheckinController with MessageStateMixin {
  final informationForm = signal<PatientInformationFormModel?>(null);
}
