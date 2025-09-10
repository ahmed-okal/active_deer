import 'package:get/get.dart';

import '../controllers/book_fitness_class_controller.dart';

class BookFitnessClassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookFitnessClassController>(() => BookFitnessClassController());
  }
}
