import 'package:active_deer/feature/more/presentation/views/my_acount_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../feature/enter_card/presentation/views/widgets/enter_card_view_body.dart';
import '../../feature/fitness_class_schedule/presentation/views/widgets/fitness_class_schedule_view_body.dart';
import '../../feature/home/presentation/views/widgets/home_view_body.dart';
import '../../feature/mySubscription/presentation/views/widgets/my_subscription_view_body.dart';
import 'bottom_nav_bar_controller.dart';
import 'custom_bottom_nav_bar.dart';

class MainNavigationView extends GetView<BottomNavBarController> {
  const MainNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: PageView(
          controller: controller.pageController,
          onPageChanged: controller.onPageChanged,
          children: const [
            HomeViewBody(),
            MySubscriptionViewBody(),
            EnterCardViewBody(),
            FitnessClassScheduleViewBody(),
            MyAcountView(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
