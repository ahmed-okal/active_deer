import 'package:get/get.dart';

import '../../feature/nutritional_advice/presentation/getx/bindings/nutritional_advice_binding.dart';
import '../../feature/nutritional_advice/presentation/views/nutritional_advice_view.dart';
import '../../feature/auth/login/presentation/getx/bindings/login_binding.dart';
import '../../feature/auth/login/presentation/views/auth_view.dart';
import '../../feature/home/presentation/getx/bindings/home_binding.dart';
import '../../feature/home/presentation/views/home_view.dart';
import '../../feature/mySubscription/presentation/getx/bindings/my_subscription_binding.dart';
import '../../feature/mySubscription/presentation/views/my_subscription_view.dart';
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
  ];
}
