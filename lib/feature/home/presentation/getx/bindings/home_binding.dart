import 'package:active_deer/core/widgets/bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

import '../controllers/days_section_picker_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DaysSectionPickerController>(
      () => DaysSectionPickerController(),
    );
    Get.lazyPut<BottomNavBarController>(() => BottomNavBarController());
  }
}
