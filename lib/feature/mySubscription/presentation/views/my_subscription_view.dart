import 'package:active_deer/core/utils/app_border.dart';
import 'package:active_deer/core/utils/app_padding.dart';
import 'package:active_deer/feature/mySubscription/presentation/views/widgets/my_subscription_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/size_config.dart';
import '../../../home/presentation/views/widgets/home_premium_card.dart';
import '../getx/controllers/my_subscription_controller.dart';

class MySubscriptionView extends GetView<MySubscriptionController> {
  const MySubscriptionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: const MySubscriptionAppBar(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: AppSize.getWidth(20),
                end: AppSize.getWidth(20),
                top: AppSize.getHeight(28),
                bottom: AppSize.getHeight(11),
              ),
              child: SizedBox(
                height: AppSize.getHeight(28),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  separatorBuilder: (context, index) =>
                      SizedBox(width: AppSize.getWidth(6)),
                  itemBuilder: (context, index) {
                    return Obx(
                      () => InkWell(
                        onTap: () => controller.changePage(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          height: AppSize.getHeight(28),
                          width: AppSize.getWidth(71),
                          decoration: controller.currentPage.value == index
                              ? AppBorder.primaryButtonBorder
                              : AppBorder.secondaryButtonBorder,
                          child: Center(
                            child: Text(
                              controller.pages[index],
                              style: controller.currentPage.value == index
                                  ? AppTextTheme.white900(size: 14)
                                  : AppTextTheme.primary900(size: 14),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverList.separated(
            itemCount: 30,
            itemBuilder: (context, index) {
              return HomePremiumCard(padding: AppPadding.horizontalPadding20);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: AppSize.getHeight(16));
            },
          ),
        ],
      ),
    );
  }
}
