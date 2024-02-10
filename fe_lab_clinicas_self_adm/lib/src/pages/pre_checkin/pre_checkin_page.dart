import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

import '../../shared/data_item.dart';

class PreCheckinPage extends StatelessWidget {
  const PreCheckinPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);

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
                  child: const Text(
                    'Arnaldo Borges',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                const DataItem(
                    label: "Nome do Paciente",
                    value: "Arnaldo",
                    padding: EdgeInsets.only(bottom: 14)),
                const DataItem(
                    label: "Email",
                    value: "Arnaldo",
                    padding: EdgeInsets.only(bottom: 14)),
                const DataItem(
                    label: "Telefone de contato ",
                    value: "Arnaldo",
                    padding: EdgeInsets.only(bottom: 14)),
                const DataItem(
                    label: "CPF",
                    value: "Arnaldo",
                    padding: EdgeInsets.only(bottom: 14)),
                const DataItem(
                    label: "CEP",
                    value: "Arnaldo",
                    padding: EdgeInsets.only(bottom: 14)),
                const DataItem(
                    label: "Responsavel",
                    value: "Arnaldo",
                    padding: EdgeInsets.only(bottom: 14)),
                const DataItem(
                    label: "Documento de Identificação",
                    value: "000.000.000-00",
                    padding: EdgeInsets.only(bottom: 14)),
                const SizedBox(
                  height: 48,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          fixedSize: const Size.fromHeight(48),
                        ),
                        onPressed: () {},
                        child: const Text('CHAMAR OUTRA SENHA'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromHeight(48)),
                      onPressed: () {},
                      child: const Text('ATENDER'),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
