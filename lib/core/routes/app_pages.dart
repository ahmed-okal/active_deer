import 'package:active_deer/feature/book_fitness_class/presentation/views/book_exercise.dart';
import 'package:get/get.dart';

import '../../feature/auth/presentation/views/change_password_success.dart';
import '../../feature/auth/presentation/views/create_new_password.dart';
import '../../feature/auth/presentation/views/enter_pin_view.dart';
import '../../feature/auth/presentation/views/forgot_password_view.dart';
import '../../feature/book_fitness_class/presentation/getx/bindings/book_fitness_class_binding.dart';
import '../../feature/book_fitness_class/presentation/views/book_fitness_class_view.dart';
import '../../feature/auth/presentation/getx/bindings/login_binding.dart';
import '../../feature/auth/presentation/views/auth_view.dart';
import '../../feature/book_fitness_class/presentation/views/book_success.dart';
import '../../feature/fitness_class_schedule/presentation/getx/bindings/fitness_class_schedule_binding.dart';
import '../../feature/fitness_class_schedule/presentation/views/fitness_class_schedule_view.dart';
import '../../feature/home/presentation/getx/bindings/home_binding.dart';
import '../../feature/home/presentation/views/home_view.dart';
import '../../feature/mySubscription/presentation/getx/bindings/my_subscription_binding.dart';
import '../../feature/mySubscription/presentation/views/my_subscription_view.dart';
import '../../feature/nutritional_advice/presentation/getx/bindings/nutritional_advice_binding.dart';
import '../../feature/nutritional_advice/presentation/views/advice_view.dart';
import '../../feature/nutritional_advice/presentation/views/nutritional_advice_view.dart';
import '../../feature/offers/presentation/getx/bindings/offers_binding.dart';
import '../../feature/offers/presentation/views/offers_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.auth;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.auth,
      page: () => const AuthView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.offers,
      page: () => const OffersView(),
      binding: OffersBinding(),
    ),
    GetPage(
      name: _Paths.mySubscription,
      page: () => const MySubscriptionView(),
      binding: MySubscriptionBinding(),
    ),
    GetPage(
      name: _Paths.nutritionalAdvice,
      page: () => const NutritionalAdviceView(),
      binding: NutritionalAdviceBinding(),
    ),
    GetPage(
      name: _Paths.advice,
      page: () => const AdviceView(),
      binding: NutritionalAdviceBinding(),
    ),
    GetPage(
      name: _Paths.fitnessClassSchedule,
      page: () => const FitnessClassScheduleView(),
      binding: FitnessClassScheduleBinding(),
    ),
    GetPage(
      name: _Paths.bookFitnessClass,
      page: () => const BookFitnessClassView(),
      binding: BookFitnessClassBinding(),
    ),
    GetPage(
      name: _Paths.bookExercise,
      page: () => const BookExercise(),
      binding: BookFitnessClassBinding(),
    ),
    GetPage(
      name: _Paths.bookSuccess,
      page: () => const BookingSuccessPage(),
      binding: BookFitnessClassBinding(),
    ),
    GetPage(
      name: _Paths.passwordSuccess,
      page: () => const PasswordChangeSuccessPage(),
    ),
    GetPage(
      name: _Paths.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.enterPin,
      page: () => const EnterPinView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.createNewPassword,
      page: () => const CreateNewPasswordView(),
      binding: LoginBinding(),
    ),
  ];
}
