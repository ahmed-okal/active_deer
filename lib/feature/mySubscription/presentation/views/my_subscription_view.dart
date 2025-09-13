import 'package:active_deer/core/utils/app_padding.dart';
import 'package:active_deer/core/widgets/custom_app_bar.dart';
import 'package:active_deer/feature/mySubscription/presentation/views/widgets/my_subscription_tap_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../home/presentation/views/widgets/home_premium_card.dart';
import '../getx/controllers/my_subscription_controller.dart';

class MySubscriptionView extends GetView<MySubscriptionController> {
  const MySubscriptionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              flexibleSpace: CustomAppBar(title: 'mySubscriptions'.tr),
            ),
            SliverToBoxAdapter(child: const MySubscriptionTapBar()),
            SliverPadding(
              padding: AppPadding.bottomPadding25,
              sliver: SliverList.separated(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return HomePremiumCard(
                    padding: AppPadding.horizontalPadding20,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: AppSize.getHeight(16));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
