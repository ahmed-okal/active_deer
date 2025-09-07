import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_text_theme.dart';
import '../utils/app_colors.dart';
import '../utils/size_config.dart';

void failedSnaskBar(String errorMessage) {
  Get.snackbar(
    '',
    '',
    titleText: Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSize.getWidth(10),
        end: AppSize.getWidth(10),
      ),
      child: Text('error'.tr, style: AppTextTheme.white700(size: 14)),
    ),
    messageText: Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSize.getWidth(10),
        end: AppSize.getWidth(10),
      ),
      child: Text(errorMessage, style: AppTextTheme.white700(size: 14)),
    ),
    backgroundColor: AppColors.secondry,
    icon: Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSize.getHeight(16),
        horizontal: AppSize.getWidth(10),
      ),
      child: Icon(
        Icons.cancel_rounded,
        color: AppColors.white,
        size: AppSize.getHeight(24),
      ),
    ),
    duration: const Duration(seconds: 3),
    snackPosition: SnackPosition.BOTTOM,
  );
}
