import 'package:active_deer/core/utils/app_border.dart';
import 'package:active_deer/core/utils/app_colors.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class AppAppBarThemeData {
  static final appBarLightTheme = AppBarTheme(
    backgroundColor: AppColors.primary,
    surfaceTintColor: AppColors.primary,
    foregroundColor: AppColors.primary,
    elevation: 2,
    toolbarHeight: AppSize.getHeight(60),
    centerTitle: true,
    shape: AppBorder.appBarBorder,
  );
}
