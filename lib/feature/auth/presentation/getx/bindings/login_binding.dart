import 'package:active_deer/feature/auth/presentation/getx/controllers/date_picker_controller.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/create_new_password_controller.dart';
import '../controllers/enter_pin_controller.dart';
import '../controllers/forgot_password_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/signup_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<DatePickerController>(() => DatePickerController());
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
    Get.lazyPut<EnterPinController>(() => EnterPinController());
    Get.lazyPut<CreateNewPasswordController>(
      () => CreateNewPasswordController(),
    );
  }
}
