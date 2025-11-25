import 'package:active_deer/core/utils/app_colors.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_assets.dart';

class ErrorView extends StatelessWidget {
  final String? errorMessage;
  final VoidCallback? onRetry;

  const ErrorView({super.key, this.errorMessage, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.getWidth(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.error, height: AppSize.getHeight(150)),
              SizedBox(height: AppSize.getHeight(20)),
              Text(
                'error'.tr,
                style: TextStyle(
                  fontSize: AppSize.getHeight(18),
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: AppSize.getHeight(10)),
              Text(
                errorMessage ?? 'somethingWentWrong'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppSize.getHeight(14),
                  color: AppColors.grey,
                ),
              ),
              if (onRetry != null) ...[
                SizedBox(height: AppSize.getHeight(20)),
                ElevatedButton(
                  onPressed: onRetry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSize.getHeight(10),
                      ),
                    ),
                  ),
                  child: Text(
                    'retry'.tr,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: AppSize.getHeight(16),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
