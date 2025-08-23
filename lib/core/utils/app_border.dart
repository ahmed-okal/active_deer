import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppBorder {
  static final OutlineInputBorder appBarBorder = OutlineInputBorder(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
    borderSide: BorderSide.none,
  );

  static final OutlineInputBorder textFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primary,
      width: AppSize.getHeight(1.5),
    ),
    borderRadius: BorderRadius.circular(6.77),
  );
  static final OutlineInputBorder textFieldFocusedBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primary,
      width: AppSize.getHeight(2),
    ),
    borderRadius: BorderRadius.circular(6.77),
  );
  static final OutlineInputBorder textFieldErrorBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primary,
      width: AppSize.getHeight(1.5),
    ),
    borderRadius: BorderRadius.circular(6.77),
  );
  static final Decoration primaryButtonBorder = BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.circular(10.4),
  );
  static final Decoration secondaryButtonBorder = BoxDecoration(
    color: AppColors.primary,
    border: Border.all(color: AppColors.primary, width: AppSize.getHeight(1.5)),
    borderRadius: BorderRadius.circular(6.77),
  );
}
