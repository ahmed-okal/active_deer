import 'package:active_deer/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_text_theme.dart';
import '../utils/app_border.dart';
import '../utils/app_colors.dart';
import '../utils/size_config.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isLoading;
  final double? height;
  final double? textSize;
  final bool? showIcon;
  final String? icon;
  final bool? isEnable;
  const CustomPrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.height = 48,
    this.textSize,
    this.showIcon = false,
    this.icon,
    this.isEnable = true,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnable == true ? onTap : null,
      child: Container(
        height: AppSize.getHeight(height ?? 48),
        decoration: isEnable == true
            ? AppBorder.primaryButtonBorder
            : AppBorder.disabledPrimaryButtonBorder,
        child: Center(
          child: isLoading
              ? const LoadingWidget()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: AppTextTheme.white700(size: textSize ?? 15.6),
                    ),
                    showIcon == true
                        ? SvgPicture.asset(
                            icon ?? '',
                            height: AppSize.getHeight(16),
                            width: AppSize.getWidth(16),
                            color: AppColors.white,
                          )
                        : SizedBox(),
                  ],
                ),
        ),
      ),
    );
  }
}
