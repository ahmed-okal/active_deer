import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';

class SuccessTwoUpLines extends StatelessWidget {
  const SuccessTwoUpLines({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Container(
            margin: EdgeInsetsDirectional.only(start: AppSize.getWidth(16)),
            height: AppSize.getHeight(5),
            width: AppSize.getWidth(160),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(6),
                bottomEnd: Radius.circular(6),
              ),
            ),
          ),
        ),
        SizedBox(height: AppSize.getHeight(20)),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Container(
            height: AppSize.getHeight(5),
            width: AppSize.getWidth(160),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    );
  }
}
