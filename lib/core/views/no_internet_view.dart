import 'package:active_deer/core/utils/app_colors.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_assets.dart';

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
              SvgPicture.asset(
                AppAssets.wifiError,
                height: AppSize.getHeight(80),
                width: AppSize.getWidth(80),
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
