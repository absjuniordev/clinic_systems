import 'package:brasil_fields/brasil_fields.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/model/self_service_model.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_form_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/widgets/lab_clinicas_self_service_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage>
    with PatientFormController, MessageViewMixin {
  final formKey = GlobalKey<FormState>();
  final selfServiceController = Injector.get<SelfServiceController>();
  final PatientController controller = Injector.get<PatientController>();

  late bool patientFound;
  late bool enableForm;
  @override
  void initState() {
    messageListener(controller);
    final SelfServiceModel(:patient) = selfServiceController.model;

    patientFound = patient != null;
    enableForm = !patientFound;

    initializeForm(patient);
    effect(() {
      if (controller.nextStep) {
        selfServiceController.updatePatientAndGoDocument(controller.patient);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    disposeForm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return PopScope(
      // canPop: false,
      onPopInvoked: (didPop) {},
      child: Scaffold(
        appBar: LabClinicasSelfServiceAppBar(),
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 18),
              padding: const EdgeInsets.all(32),
              width: sizeOf.width * .8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: LabClinicasTheme.orangeColor),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Visibility(
                      visible: patientFound,
                      replacement: Image.asset("assets/images/lupa_icon.png"),
                      child: Image.asset('assets/images/check_icon.png'),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Visibility(
                      visible: patientFound,
                      replacement: const Text(
                        "Cadastro Não encontrado",
                        style: LabClinicasTheme.titleSmallStyle,
                      ),
                      child: const Text(
                        "Cadastro encontrado",
                        style: LabClinicasTheme.titleSmallStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Visibility(
                      visible: patientFound,
                      replacement: const Text(
                        "Preencha o formulario abaixo para fazer o cadastro",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: LabClinicasTheme.blueColor,
                        ),
                      ),
                      child: const Text(
                        "Confirme os dados do seu cadastro",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: LabClinicasTheme.blueColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      readOnly: !enableForm,
                      controller: nameEC,
                      validator: Validatorless.required("Nome obrigatório"),
                      decoration: const InputDecoration(
                        label: Text("Nome do Paciente"),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      readOnly: !enableForm,
                      controller: emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.email("Email inavlido"),
                        Validatorless.required("Email"),
                      ]),
                      decoration: const InputDecoration(
                        label: Text('Emal'),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      readOnly: !enableForm,
                      controller: phoneEC,
                      validator: Validatorless.required("telefone obrigatório"),
                      inputFormatters: [
                        TelefoneInputFormatter(),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        label: Text('Telefono de contato'),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      readOnly: !enableForm,
                      validator: Validatorless.required("CPF obrigatório"),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter()
                      ],
                      controller: documentEC,
                      decoration: const InputDecoration(
                        label: Text('Digite o seu CPF'),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      readOnly: !enableForm,
                      controller: cepEC,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CepInputFormatter()
                      ],
                      validator: Validatorless.required("CEP obrigatório"),
                      decoration: const InputDecoration(
                        label: Text('CEP'),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 3,
                          child: TextFormField(
                            readOnly: !enableForm,
                            controller: streetEC,
                            validator:
                                Validatorless.required("Endereço obrigatório"),
                            decoration: const InputDecoration(
                              label: Text('Endereço'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Flexible(
                          child: TextFormField(
                            readOnly: !enableForm,
                            validator:
                                Validatorless.required("Numero obrigatório"),
                            controller: numberEC,
                            decoration: const InputDecoration(
                              label: Text('Numero'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextFormField(
                            readOnly: !enableForm,
                            controller: complementEC,
                            decoration: const InputDecoration(
                              label: Text('Complemento'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: TextFormField(
                            readOnly: !enableForm,
                            controller: stateEC,
                            validator:
                                Validatorless.required("Estado obrigatório"),
                            decoration: const InputDecoration(
                              label: Text('Estado'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextFormField(
                            readOnly: !enableForm,
                            controller: cityEC,
                            validator:
                                Validatorless.required("Cidade obrigatório"),
                            decoration: const InputDecoration(
                              label: Text('Cidade'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: TextFormField(
                            readOnly: !enableForm,
                            controller: districtEC,
                            validator:
                                Validatorless.required("Bairro obrigatório"),
                            decoration: const InputDecoration(
                              label: Text('Bairro'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      readOnly: !enableForm,
                      controller: guardianEC,
                      decoration: const InputDecoration(
                        label: Text('Responsavel'),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      readOnly: !enableForm,
                      controller: guardianIdentificationNumberEC,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter()
                      ],
                      decoration: const InputDecoration(
                        label: Text('Documento de Identificação'),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Visibility(
                      visible: !enableForm,
                      replacement: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            final valid =
                                formKey.currentState?.validate() ?? false;
                            if (valid) {
                              controller.updateAndNext(updatePatient(
                                  selfServiceController.model.patient!));
                            }
                          },
                          child: Visibility(
                            visible: !patientFound,
                            replacement: const Text("SALVAR E CONTINUAR"),
                            child: const Text("CADASTRAR"),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    enableForm = true;
                                  });
                                },
                                child: const Text("EDITAR"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.patient =
                                      selfServiceController.model.patient;
                                  controller.goNextStep();
                                },
                                child: const Text("CONTINUAR"),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
