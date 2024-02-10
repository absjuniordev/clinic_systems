import 'package:fe_lab_clinicas_self_adm/src/core/env.dart';
import 'package:flutter/material.dart';

class CheckinImageDialog extends AlertDialog {
  CheckinImageDialog(BuildContext context,
      {super.key, required String pathImage})
      : super(
          content: Image.network(
            '${Env.backendBaseUrl}/$pathImage',
            fit: BoxFit.contain,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            )
          ],
        );
}
