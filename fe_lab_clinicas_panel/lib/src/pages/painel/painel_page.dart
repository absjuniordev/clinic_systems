import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

import 'widgets/painel_principal_widgets.dart';

class PainelPage extends StatelessWidget {
  const PainelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .4,
                  child: const PainelPrincipalWidgets(
                    password: 'KHDKJDG',
                    passorwdLabel: 'Senha Anterior',
                    deskNNumber: '08',
                    buttonColor: LabClinicasTheme.blueColor,
                    labelColor: LabClinicasTheme.orangeColor,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .4,
                  child: const PainelPrincipalWidgets(
                    password: 'KHDKJDG',
                    passorwdLabel: 'Chamando Senha',
                    deskNNumber: '08',
                    buttonColor: LabClinicasTheme.orangeColor,
                    labelColor: LabClinicasTheme.blueColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
