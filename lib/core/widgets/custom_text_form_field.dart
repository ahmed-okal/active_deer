import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../theme/app_text_theme.dart';
import '../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.focusNode,
    this.controller,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onTapOutside,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.textInputAction,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines = 1,
    this.enabled = true,
    this.readOnly = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.obscureText = false,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.style,
  });
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final bool enabled;
  final bool readOnly;
  final bool enableSuggestions;
  final bool autocorrect;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      focusNode: focusNode,
      controller: controller,
      autovalidateMode: AutovalidateMode.disabled,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextTheme.secondary400(
          size: 12,
        ).copyWith(height: AppSize.getHeight(1.5)),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        // Custom error text styling
        errorStyle: AppTextTheme.secondary400(size: 10).copyWith(
          color: AppColors.red,
          height: 1.0,
          fontWeight: FontWeight.w400,
        ),
        errorMaxLines: 1,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSize.getWidth(14),
          vertical: AppSize.getHeight(8),
        ),
      ),
      style:
          style ??
          AppTextTheme.primary600(
            size: 15,
          ).copyWith(height: AppSize.getHeight(1.5)),
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      onTapOutside: onTapOutside,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      obscureText: obscureText,
      obscuringCharacter: '*',
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: minLines,
      enabled: enabled,
      readOnly: readOnly,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
    );
  }
}
