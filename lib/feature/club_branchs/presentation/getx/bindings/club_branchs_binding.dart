import 'package:get/get.dart';

import '../controllers/club_branchs_controller.dart';

class ClubBranchsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClubBranchsController>(() => ClubBranchsController());
  }
}
