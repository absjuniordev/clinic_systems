import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_adm/src/models/patiente_information_form_model.dart';
import 'package:fe_lab_clinicas_self_adm/src/pages/checkin/checkin_controller.dart';
import 'package:fe_lab_clinicas_self_adm/src/pages/checkin/widget/chekcin_image_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../shared/data_item.dart';

class CheckinPage extends StatefulWidget {
  const CheckinPage({super.key});

  @override
  State<CheckinPage> createState() => _CheckinPageState();
}

class _CheckinPageState extends State<CheckinPage> with MessageViewMixin {
  final controller = Injector.get<CheckinController>();
  @override
  void initState() {
    messageListener(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    final PatientInformationFormModel(:password, :patient) =
        controller.informationForm.watch(context)!;

    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.all(40),
            width: sizeOf.width * 0.5,
            margin: const EdgeInsets.only(top: 56),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/patient_avatar.png'),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'A senha chamada foi',
                  style: LabClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  width: 218,
                  decoration: BoxDecoration(
                    color: LabClinicasTheme.orangeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    password,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: LabClinicasTheme.ligthGrayColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "Cadastro",
                    style: LabClinicasTheme.subTitleSmallStyle.copyWith(
                      color: LabClinicasTheme.orangeColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                DataItem(
                    label: "Nome do Paciente",
                    value: patient.name,
                    padding: const EdgeInsets.only(bottom: 24)),
                DataItem(
                    label: "Email",
                    value: patient.email,
                    padding: const EdgeInsets.only(bottom: 24)),
                DataItem(
                    label: "Telefone de contato ",
                    value: patient.phoneNumber,
                    padding: const EdgeInsets.only(bottom: 24)),
                DataItem(
                    label: "CPF",
                    value: patient.document,
                    padding: const EdgeInsets.only(bottom: 24)),
                DataItem(
                    label: "CEP",
                    value: patient.address.cep,
                    padding: const EdgeInsets.only(bottom: 24)),
                DataItem(
                    label: "Endereço",
                    value:
                        '${patient.address.streetAddress},  ${patient.address.number}, '
                        '${patient.address.addressComplement}, ${patient.address.district}, '
                        '${patient.address.city} - ${patient.address.state}',
                    padding: const EdgeInsets.only(bottom: 24)),
                DataItem(
                    label: "Responsavel",
                    value: patient.guardian,
                    padding: const EdgeInsets.only(bottom: 24)),
                DataItem(
                    label: "Documento de Identificação",
                    value: patient.guardianIdentificationNumber,
                    padding: const EdgeInsets.only(bottom: 24)),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: LabClinicasTheme.ligthGrayColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "Validar Images Exames",
                    style: LabClinicasTheme.subTitleSmallStyle.copyWith(
                      color: LabClinicasTheme.orangeColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ChekcinImageLink(
                      label: "Carteirinha",
                    ),
                    Column(
                      children: [
                        ChekcinImageLink(
                          label: "Carteirinha",
                        ),
                        ChekcinImageLink(
                          label: "Carteirinha",
                        ),
                        ChekcinImageLink(
                          label: "Carteirinha",
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/chekin',
                          arguments: controller.informationForm);
                    },
                    child: const Text('ATENDER'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
