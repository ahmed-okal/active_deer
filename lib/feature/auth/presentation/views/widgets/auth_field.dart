import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.title,
    required this.hintText,
    this.keyboardType,
    required this.controller,
    this.validator,
    required this.isObscure,
    this.suffixIcon,
    this.prefixIcon,
    this.style,
    this.textInputAction,
    this.inputFormatters,
    this.readOnly = false,
  });
  final String title, hintText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isObscure;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextTheme.primary700(size: 14)),
        SizedBox(height: AppSize.getHeight(5)),
        CustomTextFormField(
          style: style,
          controller: controller,
          validator: validator,
          obscureText: isObscure,
          hintText: hintText,
          keyboardType: keyboardType,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          readOnly: readOnly,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
        ),
      ],
    );
  }
}
