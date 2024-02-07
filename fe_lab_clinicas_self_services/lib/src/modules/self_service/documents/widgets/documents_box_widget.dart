import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class DocumentsBoxWidget extends StatelessWidget {
  const DocumentsBoxWidget({
    super.key,
    required this.uploaded,
    required this.icon,
    required this.label,
    required this.totalFiles,
  });

  final Widget icon;
  final bool uploaded;
  final String label;
  final int totalFiles;

  @override
  Widget build(BuildContext context) {
    final totalFileLabel = totalFiles > 0 ? '($totalFiles)' : '';
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: uploaded ? LabClinicasTheme.ligthOrangeColor : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: LabClinicasTheme.orangeColor,
          ),
        ),
        child: Column(
          children: [
            Expanded(child: icon),
            Text(
              '$label $totalFileLabel',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: LabClinicasTheme.orangeColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
