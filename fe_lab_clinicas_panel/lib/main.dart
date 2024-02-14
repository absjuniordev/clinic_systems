import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_panel/src/pages/login/login_router.dart';
import 'package:fe_lab_clinicas_panel/src/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'src/binding/lab_clinicas_application_binding.dart';

void main() {
  runApp(const LabClinicasPanel());
}

class LabClinicasPanel extends StatelessWidget {
  const LabClinicasPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      pagesBuilder: [
        FlutterGetItPageBuilder(
          page: (_) => const SplashPage(),
          path: '/',
        )
      ],
      title: 'Lab Clinicas Panel',
      pages: const [
        LoginRouter(),
      ],
      binding: LabClinicasApplicationBinding(),
    );
  }
}
