import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_text_theme.dart';
import '../utils/size_config.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final String icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: AppSize.getHeight(24),
            width: AppSize.getWidth(24),
          ),
          SizedBox(width: AppSize.getWidth(4)),
          Text(title, style: AppTextTheme.white700(size: 14)),
        ],
      ),
    );
  }
}
