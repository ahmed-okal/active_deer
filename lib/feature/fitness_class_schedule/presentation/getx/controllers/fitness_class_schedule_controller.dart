import 'package:get/get.dart';

class FitnessClassScheduleController extends GetxController {
  final RxInt currentExercise = 0.obs;
  void changeExercise(int index) {
    currentExercise.value = index;
  }
}
