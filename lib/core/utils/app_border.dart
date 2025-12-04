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
    borderRadius: BorderRadius.circular(6.77),
    borderSide: BorderSide(color: AppColors.red, width: AppSize.getWidth(1.5)),
  );
  static final Decoration primaryButtonBorder = BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.circular(10.4),
  );
  static final Decoration disabledPrimaryButtonBorder = BoxDecoration(
    color: AppColors.grey,
    borderRadius: BorderRadius.circular(10.4),
  );
  static final Decoration secondaryButtonBorder = BoxDecoration(
    border: Border.all(color: AppColors.primary, width: AppSize.getHeight(1.5)),
    borderRadius: BorderRadius.circular(6.77),
  );
  static final Decoration thirdButtonBorder = BoxDecoration(
    color: AppColors.secondry,
    border: Border.all(
      color: AppColors.secondry,
      width: AppSize.getHeight(1.5),
    ),
    borderRadius: BorderRadius.circular(6.77),
  );
  static final Decoration homeContainerBorder = BoxDecoration(
    gradient: LinearGradient(
      colors: [AppColors.primary, AppColors.darkGrey],
      begin: AlignmentDirectional.centerStart,
      end: AlignmentDirectional.centerEnd,
    ),
    borderRadius: BorderRadius.circular(6),
  );
  static final Decoration homeCardBorder = BoxDecoration(
    border: Border.all(color: AppColors.darkGrey, width: AppSize.getHeight(1)),
    borderRadius: BorderRadius.circular(6),
  );

  static final Decoration homeCardPrimaryBorder = BoxDecoration(
    border: Border.all(color: AppColors.primary, width: AppSize.getHeight(1)),
    borderRadius: BorderRadius.circular(6),
  );
  static final Decoration imageBorder = BoxDecoration(
    borderRadius: BorderRadius.circular(6),
  );
}
