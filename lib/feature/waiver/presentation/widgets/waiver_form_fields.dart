import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/app_validation.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../getx/controllers/waiver_controller.dart';

class WaiverFormFields extends GetView<WaiverController> {
  const WaiverFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'nameOfThePersonToWhomTheTransferIsMade'.tr,
          style: AppTextTheme.primary700(size: 14),
        ),
        SizedBox(height: AppSize.getHeight(5)),
        CustomTextFormField(
          controller: controller.nameController,
          hintText: 'enterFullName'.tr,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          validator: (value) => AppValidation.name(value),
        ),
        SizedBox(height: AppSize.getHeight(10)),
        Text(
          'phoneNumberMebership'.tr,
          style: AppTextTheme.primary700(size: 14),
        ),
        SizedBox(height: AppSize.getHeight(5)),
        CustomTextFormField(
          controller: controller.phoneOrIdController,
          hintText: 'enterPhoneNumberMembership'.tr,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          // Accept phone OR membership id
          validator: (value) => AppValidation.phoneOrId(value),
        ),
        SizedBox(height: AppSize.getHeight(50)),
        Text(
          '${'waiverReason'.tr} (${'optional'.tr})',
          style: AppTextTheme.primary700(size: 14),
        ),
        SizedBox(height: AppSize.getHeight(5)),
        CustomTextFormField(
          controller: controller.reasonController,
          hintText: 'waiverReason'.tr,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          minLines: 3,
          maxLines: 3,
        ),
      ],
    );
  }
}

