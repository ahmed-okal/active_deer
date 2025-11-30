import 'package:get/get.dart';

import 'login_controller.dart';
import 'signup_controller.dart';

class AuthController extends GetxController {
  final RxInt currentPage = 0.obs;

  void changePage(int index) {
    currentPage.value = index;
  }

  final SignUpController signUpController = Get.find<SignUpController>();
  final LoginController loginController = Get.find<LoginController>();
}
