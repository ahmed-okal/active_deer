import 'package:active_deer/core/utils/app_colors.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi_off_rounded,
                size: AppSize.getHeight(100),
                color: AppColors.primary,
              ),
              SizedBox(height: AppSize.getHeight(20)),
              Text(
                'noInternetConnection'.tr,
                style: TextStyle(
                  fontSize: AppSize.getHeight(18),
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: AppSize.getHeight(10)),
              Text(
                'pleaseCheckYourInternetConnection'.tr,
                style: TextStyle(
                  fontSize: AppSize.getHeight(14),
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
