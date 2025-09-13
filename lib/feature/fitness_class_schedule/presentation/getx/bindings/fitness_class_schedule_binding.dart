import 'package:active_deer/feature/home/presentation/getx/controllers/days_section_picker_controller.dart';
import 'package:get/get.dart';

import '../controllers/fitness_class_schedule_controller.dart';

class FitnessClassScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FitnessClassScheduleController>(
      () => FitnessClassScheduleController(),
    );
    Get.lazyPut<DaysSectionPickerController>(
      () => DaysSectionPickerController(),
    );
  }
}
