import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/custom_primary_button.dart';
import '../getx/controllers/waiver_controller.dart';
import 'waiver_confirmation_bottom_sheet.dart';

class WaiverSubmitButton extends GetView<WaiverController> {
  const WaiverSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPrimaryButton(
      title: 'next'.tr,
      onTap: () {
        if (!controller.validateForm()) return;
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => const WaiverConfirmationBottomSheet(),
        );
      },
    );
  }
}
