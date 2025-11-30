import 'package:get/get.dart';

import 'signup_controller.dart';

class AuthController extends GetxController {
  final RxInt currentPage = 0.obs;

  void changePage(int index) {
    currentPage.value = index;
  }

  final SignUpController signUpController = Get.find<SignUpController>();
}
