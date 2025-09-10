import 'package:active_deer/core/utils/app_border.dart';
import 'package:active_deer/core/widgets/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_drawer.dart';

class BookExercise extends StatelessWidget {
  const BookExercise({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>?;

    final heroTag = arguments?['heroTag'] ?? 'exercise';

    return Scaffold(
      drawer: const CustomDrawer(),
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
                flexibleSpace: CustomAppBar(title: 'bookFitnessClass'.tr),
              ),
            ],
          ),

          // Draggable bottom sheet that starts at 200 height and can expand
          DraggableScrollableSheet(
            initialChildSize:
                0.67, // Starts at 25% of screen (approximately 200px)
            minChildSize: 0.67, // Minimum 15% of screen
            maxChildSize: 0.67, // Can expand to 95% of screen
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
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                        vertical: AppSize.getHeight(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: AppSize.getHeight(1.5),
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                  start: AppSize.getWidth(4),
                                ),
                                child: Container(
                                  height: AppSize.getHeight(1.5),
                                  width: AppSize.getWidth(15),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(20),
                                  ),
                                ),
                              ),
                              Container(
                                height: AppSize.getHeight(1.5),
                                width: AppSize.getWidth(15),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(20),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.symmetric(
                              horizontal: AppSize.getWidth(10),
                            ),
                            child: Text(
                              'تمارين الجزء العلوي',
                              style: AppTextTheme.primary700(size: 20),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: AppSize.getHeight(1.5),
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                  start: AppSize.getWidth(4),
                                ),
                                child: Container(
                                  height: AppSize.getHeight(1.5),
                                  width: AppSize.getWidth(15),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(20),
                                  ),
                                ),
                              ),
                              Container(
                                height: AppSize.getHeight(1.5),
                                width: AppSize.getWidth(15),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: AppPadding.horizontalPadding20,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          spacing: AppSize.getHeight(20),
                          children: [
                            Container(
                              padding: AppPadding.allPadding12,
                              height: AppSize.getHeight(128),
                              decoration: AppBorder.homeCardBorder,
                              child: Column(
                                spacing: AppSize.getHeight(5),
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        color: AppColors.primary,
                                        size: AppSize.getHeight(20),
                                      ),
                                      SizedBox(width: AppSize.getWidth(4)),
                                      Text(
                                        'من 08:00 الى 08:45',
                                        style: AppTextTheme.primary700(
                                          size: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppAssets.person,
                                        height: AppSize.getHeight(20),
                                        width: AppSize.getWidth(20),
                                      ),
                                      SizedBox(width: AppSize.getWidth(4)),
                                      Text(
                                        'المدرب : أسامة محمد',
                                        style: AppTextTheme.primary700(
                                          size: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppAssets.capacity,
                                        height: AppSize.getHeight(20),
                                        width: AppSize.getWidth(20),
                                      ),
                                      SizedBox(width: AppSize.getWidth(4)),
                                      Text(
                                        'القدرة الاستيعابية : 35',
                                        style: AppTextTheme.primary700(
                                          size: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppAssets.door,
                                        height: AppSize.getHeight(20),
                                        width: AppSize.getWidth(20),
                                      ),
                                      SizedBox(width: AppSize.getWidth(4)),
                                      Text(
                                        'غرفة اللياقة 1',
                                        style: AppTextTheme.primary700(
                                          size: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: AppSize.getHeight(70)),
                            CustomPrimaryButton(
                              title: 'approveBooking'.tr,
                              onTap: () {
                                Get.toNamed(Routes.bookSuccess);
                              },
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
