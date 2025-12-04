import 'package:get/get.dart';

import '../controllers/waiver_controller.dart';

class WaiverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaiverController>(() => WaiverController());
  }
}
