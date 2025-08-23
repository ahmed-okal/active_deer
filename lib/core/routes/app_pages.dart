import 'package:get/get.dart';

import '../../feature/auth/login/presentation/getx/bindings/login_binding.dart';
import '../../feature/auth/login/presentation/views/auth_view.dart';
import '../../feature/home/presentation/getx/bindings/home_binding.dart';
import '../../feature/home/presentation/views/home_view.dart';

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
  ];
}
