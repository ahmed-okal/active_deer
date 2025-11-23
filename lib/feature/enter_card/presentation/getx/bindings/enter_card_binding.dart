import 'package:get/get.dart';

import '../../../../../core/widgets/bottom_nav_bar_controller.dart';
import '../controllers/enter_card_controller.dart';

class EnterCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnterCardController>(() => EnterCardController());
    Get.lazyPut<BottomNavBarController>(() => BottomNavBarController());
  }
}
