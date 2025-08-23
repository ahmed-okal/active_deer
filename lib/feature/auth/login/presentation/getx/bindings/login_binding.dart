import 'package:active_deer/feature/auth/login/presentation/getx/controllers/date_picker_controller.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/signup_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<DatePickerController>(() => DatePickerController());
  }
}
