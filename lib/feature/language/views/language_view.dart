// language_view.dart
import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_text_theme.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_padding.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../getx/controllers/language_controller.dart';

class LanguageView extends GetView<LanguageController> {
  const LanguageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: CustomAppBar(
              title: 'language'.tr,
              notificationIcon: false,
            ),
          ),
          SliverPadding(
            padding: AppPadding.allPadding20,
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text('language'.tr, style: AppTextTheme.primary700(size: 16)),
                SizedBox(height: AppSize.getHeight(10)),
                Obx(
                  () => LanguageItem(
                    language: 'العربية',
                    isSelected:
                        controller.languageService.languageCode.value == 'ar',
                    onTap: () => controller.changeLanguage('ar'),
                  ),
                ),
                const SizedBox(height: 12),
                Obx(
                  () => LanguageItem(
                    language: 'English',
                    isSelected:
                        controller.languageService.languageCode.value == 'en',
                    onTap: () => controller.changeLanguage('en'),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    super.key,
    required this.language,
    required this.isSelected,
    required this.onTap,
  });
  final String language;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppSize.getHeight(45),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.secondry,
            width: AppSize.getHeight(1),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.getWidth(16)),
          child: Row(
            children: [
              Text(language, style: AppTextTheme.primary700(size: 14)),
              const Spacer(),
              SizedBox(
                width: AppSize.getWidth(24),
                height: AppSize.getHeight(24),
                child: Transform.scale(
                  scale: 1.1,
                  child: Checkbox(
                    checkColor: AppColors.background,
                    fillColor: WidgetStateProperty.all(
                      isSelected ? AppColors.primary : AppColors.background,
                    ),
                    activeColor: AppColors.background,
                    value: isSelected,
                    onChanged: (_) => onTap(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
