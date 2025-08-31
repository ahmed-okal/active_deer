import 'package:get/get.dart';

import '../controllers/nutritional_advice_controller.dart';

class NutritionalAdviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionalAdviceController>(
      () => NutritionalAdviceController(),
    );
  }
}
