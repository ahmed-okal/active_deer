import 'package:get/get.dart';

import '../controllers/enter_card_controller.dart';

class EnterCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnterCardController>(() => EnterCardController());
  }
}
