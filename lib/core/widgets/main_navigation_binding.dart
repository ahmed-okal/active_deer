import 'package:get/get.dart';
import '../../feature/enter_card/presentation/getx/controllers/enter_card_controller.dart';
import '../../feature/fitness_class_schedule/presentation/getx/controllers/fitness_class_schedule_controller.dart';
import '../../feature/home/presentation/getx/controllers/days_section_picker_controller.dart';
import '../../feature/home/presentation/getx/controllers/home_controller.dart';
import '../../feature/mySubscription/presentation/getx/controllers/my_subscription_controller.dart';
import 'bottom_nav_bar_controller.dart';

class MainNavigationBinding extends Bindings {
  @override
  void dependencies() {
    // Bottom navigation controller
    Get.lazyPut<BottomNavBarController>(() => BottomNavBarController());
    
    // Home page controllers
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DaysSectionPickerController>(() => DaysSectionPickerController());
    
    // My Subscription controller
    Get.lazyPut<MySubscriptionController>(() => MySubscriptionController());
    
    // Enter Card controller
    Get.lazyPut<EnterCardController>(() => EnterCardController());
    
    // Fitness Class Schedule controller
    Get.lazyPut<FitnessClassScheduleController>(() => FitnessClassScheduleController());
  }
}
