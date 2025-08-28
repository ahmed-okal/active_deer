import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../utils/app_colors.dart';

class CustomPresentIndicator extends StatelessWidget {
  const CustomPresentIndicator({super.key, required this.percent});
  final double percent;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LinearPercentIndicator(
        padding: EdgeInsets.zero,
        isRTL: Locale('ar', 'EG') == Get.locale ? true : false,
        barRadius: const Radius.circular(10),
        animation: true,
        animationDuration: 1000,
        lineHeight: 8.0,
        percent: percent,
        progressColor: AppColors.primary,
        backgroundColor: AppColors.grey,
      ),
    );
  }
}
