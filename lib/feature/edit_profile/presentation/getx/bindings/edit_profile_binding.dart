import 'package:get/get.dart';

import '../controllers/edit_profile_date_picker_controller.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
    Get.lazyPut<EditProfileDatePickerController>(
      () => EditProfileDatePickerController(),
    );
  }
}
