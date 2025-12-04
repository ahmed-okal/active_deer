import 'package:get/get.dart';

import '../../../../../core/widgets/bottom_nav_bar_controller.dart';
import '../controllers/my_subscription_controller.dart';

class MySubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySubscriptionController>(() => MySubscriptionController());
    Get.lazyPut<BottomNavBarController>(() => BottomNavBarController());
  }
}
