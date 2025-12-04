import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class EditProfileItem extends StatelessWidget {
  const EditProfileItem({
    super.key,
    required this.title,
    required this.hint,
    required this.keynoardType,
    required this.controller,
  });
  final String title, hint;
  final TextInputType keynoardType;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextTheme.primary700(size: 14)),
        SizedBox(height: AppSize.getHeight(5)),
        CustomTextFormField(
          hintText: hint,
          hintStyle: AppTextTheme.primary700(size: 14),
          keyboardType: keynoardType,
          controller: controller,
        ),
      ],
    );
  }
}
