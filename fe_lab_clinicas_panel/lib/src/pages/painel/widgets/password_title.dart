import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class PasswordTitle extends StatelessWidget {
  const PasswordTitle({super.key, required this.label, required this.password});
  final String label;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: LabClinicasTheme.orangeColor,
        ),
      ),
      child: Column(
        children: [
          Text(
            password,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: LabClinicasTheme.blueColor,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: LabClinicasTheme.orangeColor,
            ),
          ),
        ],
      ),
    );
  }
}
