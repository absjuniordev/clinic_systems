import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_adm/src/pages/checkin/widget/checkin_image_dialog.dart';
import 'package:flutter/material.dart';

class ChekcinImageLink extends StatelessWidget {
  const ChekcinImageLink({
    super.key,
    required this.label,
    required this.image,
  });

  final String label;
  final String image;

  void showImageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return CheckinImageDialog(
            context,
            pathImage: image,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showImageDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: LabClinicasTheme.blueColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
