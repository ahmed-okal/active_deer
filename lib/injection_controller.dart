import 'package:active_deer/core/services/api_service.dart';
import 'package:active_deer/core/services/cash_data_source.dart';
import 'package:active_deer/core/services/language_service.dart';
import 'package:active_deer/core/services/notification_service.dart';
import 'package:active_deer/core/services/theme_service.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class InjectionController {
  final getIt = GetIt.instance;
  Future<void> initialize() async {
    getIt.registerLazySingleton<ApiService>(() => ApiService());

    // Register theme and language services with GetIt
    getIt.registerLazySingleton<ThemeService>(() => ThemeService());

    getIt.registerLazySingleton<LanguageService>(() => LanguageService());
    getIt.registerLazySingleton<NotificationService>(() => NotificationService());

    // Also register with GetX for widgets that use Get.find()
    Get.put(ThemeService(), permanent: true);
    Get.put(LanguageService(), permanent: true);
    Get.put(NotificationService(), permanent: true);

    getIt.registerLazySingleton<CashDataSource>(
      () => CashDataSource(
        // getIt(),
      ),
    );
    // getIt.registerLazySingleton<LoginRemoteDataSource>(
    //   () => LoginRemoteDataSourceImpl(getIt()),
    // );
  }
}
