import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_panel/src/models/painel_checkin_model.dart';
import 'package:fe_lab_clinicas_panel/src/pages/painel/painel_controlller.dart';
import 'package:fe_lab_clinicas_panel/src/pages/painel/widgets/password_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'widgets/painel_principal_widgets.dart';

class PainelPage extends StatefulWidget {
  const PainelPage({super.key});

  @override
  State<PainelPage> createState() => _PainelPageState();
}

class _PainelPageState extends State<PainelPage> {
  final controller = Injector.get<PainelControlller>();

  @override
  void initState() {
    controller.listenerPainel();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PainelCheckinModel? current;
    final PainelCheckinModel? lastCall;
    final List<PainelCheckinModel>? others;

    final listPanel = controller.painelData.watch(context);

    current = listPanel.firstOrNull;
    if (listPanel.isNotEmpty) {
      listPanel.removeAt(0);
    }
    lastCall = listPanel.firstOrNull;
    if (listPanel.isNotEmpty) {
      listPanel.removeAt(0);
    }

    others = listPanel;

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
                lastCall != null
                    ? SizedBox(
                        width: MediaQuery.sizeOf(context).width * .4,
                        child: PainelPrincipalWidgets(
                          password: lastCall.password,
                          passorwdLabel: 'Senha Anterior',
                          deskNNumber:
                              lastCall.attendantDesk.toString().padLeft(2),
                          buttonColor: LabClinicasTheme.blueColor,
                          labelColor: LabClinicasTheme.orangeColor,
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  width: 20,
                ),
                current != null
                    ? SizedBox(
                        width: MediaQuery.sizeOf(context).width * .4,
                        child: PainelPrincipalWidgets(
                          password: current.password,
                          passorwdLabel: 'Chamando Senha',
                          deskNNumber:
                              current.attendantDesk.toString().padLeft(2),
                          buttonColor: LabClinicasTheme.orangeColor,
                          labelColor: LabClinicasTheme.blueColor,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Divider(
              color: LabClinicasTheme.orangeColor,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Últimos Chamados',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: LabClinicasTheme.orangeColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Wrap(
              runAlignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: others
                  .map(
                    (e) => PasswordTitle(
                      password: e.password,
                      deskNumber: " Guichê ${e.attendantDesk.toString()}",
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
