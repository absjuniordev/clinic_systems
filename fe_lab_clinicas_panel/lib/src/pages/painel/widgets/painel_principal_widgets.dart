import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class PainelPrincipalWidgets extends StatelessWidget {
  const PainelPrincipalWidgets({
    super.key,
    required this.passorwdLabel,
    required this.password,
    required this.deskNNumber,
    required this.labelColor,
    required this.buttonColor,
  });

  final String passorwdLabel;
  final String password;
  final String deskNNumber;

  final Color labelColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: LabClinicasTheme.orangeColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            passorwdLabel,
            style: LabClinicasTheme.titleStyle.copyWith(color: labelColor),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: buttonColor,
            ),
            child: Text(
              password,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Guichê',
            style: LabClinicasTheme.titleStyle.copyWith(color: labelColor),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: buttonColor,
            ),
            child: Text(
              deskNNumber,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
