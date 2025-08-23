import 'package:flutter/material.dart';

import '../theme/app_text_theme.dart';
import '../utils/app_border.dart';
import '../utils/size_config.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  final double? height;
  final double? textSize;
  const CustomPrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.height = 48,
    this.textSize,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppSize.getHeight(height ?? 48),
        decoration: AppBorder.primaryButtonBorder,
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  title,
                  style: AppTextTheme.white700(size: textSize ?? 15.6),
                ),
        ),
      ),
    );
  }
}
