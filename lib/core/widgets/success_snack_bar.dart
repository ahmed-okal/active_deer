import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_text_theme.dart';
import '../utils/app_colors.dart';
import '../utils/size_config.dart';

SnackbarController successSnackBar(String message) {
  return Get.snackbar(
    '',
    '',
    titleText: Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSize.getWidth(10),
        end: AppSize.getWidth(10),
      ),
      child: Text('done'.tr, style: AppTextTheme.white700(size: 12)),
    ),
    messageText: Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSize.getWidth(10),
        end: AppSize.getWidth(10),
      ),
      child: Text(message, style: AppTextTheme.white700(size: 10)),
    ),
    backgroundColor: AppColors.green,
    icon: Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSize.getHeight(8),
        horizontal: AppSize.getWidth(0),
      ),
      child: Icon(
        Icons.check_circle,
        color: AppColors.background,
        size: AppSize.getHeight(24),
      ),
    ),
    duration: const Duration(seconds: 3),
    snackPosition: SnackPosition.BOTTOM,
  );
}
