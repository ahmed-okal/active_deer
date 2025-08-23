import 'package:active_deer/feature/auth/login/presentation/views/widgets/auth_field.dart';
import 'package:active_deer/feature/auth/login/presentation/views/widgets/birth_date_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/utils/app_padding.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../getx/controllers/login_controller.dart';

class SignUpBody extends GetView<LoginController> {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontalPadding,
      child: Column(
        spacing: AppSize.getHeight(10),
        children: [
          AuthField(
            hintText: 'enterFullName'.tr,
            title: 'name'.tr,
            controller: controller.phoneController,
            isObscure: false,
          ),
          AuthField(
            hintText: 'mail'.tr,
            title: 'enterMail'.tr,
            controller: controller.phoneController,
            isObscure: false,
          ),
          AuthField(
            hintText: 'idNumber'.tr,
            title: 'enterIdNumber'.tr,
            controller: controller.phoneController,
            isObscure: true,
          ),
          const BirthDateField(),
        ],
      ),
    );
  }
}
