import 'package:active_deer/core/theme/app_text_theme.dart';
import 'package:active_deer/core/utils/app_padding.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:active_deer/feature/nutritional_advice/presentation/views/widgets/bottom_sheet_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../getx/controllers/advice_controller.dart';

class AdviceView extends GetView<AdviceController> {
  const AdviceView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the hero tag from arguments, default to 'advice' if not provided
    final arguments = Get.arguments as Map<String, dynamic>?;
    final heroTag = arguments?['heroTag'] ?? 'advice';

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height:
                MediaQuery.of(context).size.height *
                0.4, // 40% of screen height
            child: Hero(
              tag: heroTag,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.test),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // Main content with app bar
          CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                flexibleSpace: CustomAppBar(title: 'nutritionalAdvice'.tr),
              ),
            ],
          ),

          // Draggable bottom sheet that starts at 200 height and can expand
          DraggableScrollableSheet(
            initialChildSize:
                0.67, // Starts at 25% of screen (approximately 200px)
            minChildSize: 0.67, // Minimum 15% of screen
            maxChildSize: 0.89, // Can expand to 95% of screen
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const BottomSheetTitle(),
                    Padding(
                      padding: AppPadding.horizontalPadding20,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          spacing: AppSize.getHeight(20),
                          children: [
                            Text(
                              "السلطة تعد من أكثر الأطباق الصحية التي يُنصح بتناولها بانتظام، نظرًا لما تحمله من فوائد متعددة تسهم في تحسين نمط الحياة الغذائي والصحي.",
                              style: AppTextTheme.primary600(size: 16),
                            ),
                            Text(
                              "أول وأهم فائدة للسلطة هي غناها بالألياف، ما يساعد على تحسين عملية الهضم والشعور بالشبع لفترة أطول، الأمر الذي قد يساهم في التحكم بالوزن. كما تحتوي معظم مكونات السلطة من الخضروات الطازجة على فيتامينات ومعادن أساسية مثل فيتامين C، البوتاسيوم، والمغنيسيوم، وهي عناصر ضرورية لدعم جهاز المناعة وتعزيز صحة الجسم بشكل عام.",
                              style: AppTextTheme.primary600(size: 16),
                            ),
                            Text(
                              "تناول السلطة بشكل يومي يساعد أيضًا على ترطيب الجسم، بفضل احتوائها على نسبة عالية من الماء، خاصةً في مكونات مثل الخيار والخس.",
                              style: AppTextTheme.primary600(size: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
