import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../utils/app_assets.dart';
import '../utils/size_config.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(
        AppAssets.loading,
        height: AppSize.getHeight(100),
      ),
    );
  }
}
