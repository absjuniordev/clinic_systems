import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class DonePage extends StatelessWidget {
  final selfServiceController = Injector.get<SelfServiceController>();
  DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Align(
        // alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            width: sizeOf.width * .85,
            margin: const EdgeInsets.only(top: 18),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/stroke_check.png'),
                const SizedBox(
                  height: 15,
                ),
                const Text('Sua senha é',
                    style: LabClinicasTheme.titleSmallStyle),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 48,
                    minWidth: 218,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: LabClinicasTheme.orangeColor,
                  ),
                  child: Text(
                    selfServiceController.password,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text.rich(
                  TextSpan(
                    style: TextStyle(
                      color: LabClinicasTheme.blueColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(text: "AGUARDE!\n"),
                      TextSpan(text: 'Sua senha será chamado no painel'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('IMPRIMIR SENHA'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('ENVIAR SENHA VIA SMS'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LabClinicasTheme.orangeColor,
                    ),
                    onPressed: () {
                      selfServiceController.restartPorcess();
                    },
                    child: const Text(
                      'FINALIZAR',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
