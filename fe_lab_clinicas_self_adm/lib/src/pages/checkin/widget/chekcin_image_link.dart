import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class ChekcinImageLink extends StatelessWidget {
  const ChekcinImageLink({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: LabClinicasTheme.blueColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
