import 'package:active_deer/core/theme/app_text_theme.dart';
import 'package:active_deer/core/utils/app_colors.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../utils/app_border.dart';

class AppTextFieldTheme {
  static final textFieldLightTheme = InputDecorationTheme(
    border: AppBorder.textFieldBorder,
    focusedBorder: AppBorder.textFieldFocusedBorder,
    errorBorder: AppBorder.textFieldErrorBorder,
    enabledBorder: AppBorder.textFieldBorder,
    disabledBorder: AppBorder.textFieldBorder,
    hintStyle: AppTextTheme.primary400(size: 12),
    suffixIconColor: AppColors.primary,

    suffixIconConstraints: BoxConstraints(
      minWidth: AppSize.getWidth(24),
      minHeight: AppSize.getHeight(24),
    ),
  );
}
