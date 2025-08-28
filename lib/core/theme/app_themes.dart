import 'package:active_deer/core/theme/app_bar_theme.dart';
import 'package:active_deer/core/theme/app_text_field_theme.dart';
import 'package:active_deer/core/utils/app_colors.dart';
import 'package:active_deer/core/theme/bottom_nav_bar_theme.dart';
import 'package:active_deer/core/theme/pop_up_theme.dart';
import 'package:active_deer/core/theme/text_selection_theme.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    drawerTheme: DrawerThemeData(
      scrimColor: AppColors.darkGrey.withOpacity(0.5),
      backgroundColor: AppColors.primary,
      width: AppSize.getWidth(243),
    ),
    iconTheme: IconThemeData(color: AppColors.primary),
    popupMenuTheme: AppPopupMenuThemeData.popupMenuLightTheme,
    dividerColor: AppColors.primary,
    bottomNavigationBarTheme:
        AppBottomNavigationBarThemeData.bottomNavigationBarLightTheme,
    scaffoldBackgroundColor: AppColors.background,
    textSelectionTheme: AppTextSelectionThemeData.textSelectionLightTheme,
    fontFamily: 'Cairo',
    inputDecorationTheme: AppTextFieldTheme.textFieldLightTheme,
    appBarTheme: AppAppBarThemeData.appBarLightTheme,
  );

  // static final darkTheme = ThemeData(

  // );
}
