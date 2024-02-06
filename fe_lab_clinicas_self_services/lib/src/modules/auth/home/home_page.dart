import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabClinicasAppBar(
        actions: [
          PopupMenuButton<int>(
            child: const IconPopupMenuWidget(),
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Iniciar Terminal'),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Finalizar Terminal'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}
