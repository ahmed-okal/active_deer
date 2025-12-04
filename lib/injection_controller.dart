import 'package:active_deer/core/services/api_service.dart';
import 'package:active_deer/core/services/cash_data_source.dart';
import 'package:active_deer/core/services/language_service.dart';
import 'package:active_deer/core/services/notification_service.dart';
import 'package:active_deer/core/services/theme_service.dart';
import 'package:active_deer/feature/payment/data/remote_data_sources/delete_card_remote_data_source.dart';
import 'package:active_deer/feature/payment/data/remote_data_sources/save_card_remote_data_source.dart';
import 'package:active_deer/feature/payment/domain/repositories/delete_card_repo.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'feature/auth/data/remote/forget_password_remote_data_source.dart';
import 'feature/auth/data/remote/log_in_remote_data_source.dart';
import 'feature/auth/data/remote/sign_up_remote_data_source.dart';
import 'feature/auth/data/repo_impl/forget_password_repo_impl.dart';
import 'feature/auth/data/repo_impl/log_in_repo_impl.dart';
import 'feature/auth/data/repo_impl/sign_up_repo_impl.dart';
import 'feature/auth/domain/repo/forget_password_repo.dart';
import 'feature/auth/domain/repo/log_in_repo.dart';
import 'feature/auth/domain/repo/sign_up_repo.dart';
import 'feature/auth/domain/use_case/forget_password_use_case.dart';
import 'feature/auth/domain/use_case/log_in_use_case.dart';
import 'feature/auth/domain/use_case/sign_up_use_case.dart';
import 'feature/payment/data/remote_data_sources/get_card_remote_data_source.dart';
import 'feature/payment/data/repo_impl/delete_card_repo_impl.dart';
import 'feature/payment/data/repo_impl/get_card_repo_impl.dart';
import 'feature/payment/data/repo_impl/save_card_repo_impl.dart';
import 'feature/payment/domain/repositories/get_card_repo.dart';
import 'feature/payment/domain/repositories/save_card_repo.dart';
import 'feature/payment/domain/use_cases/delete_card_use_case.dart';
import 'feature/payment/domain/use_cases/get_card_use_case.dart';
import 'feature/payment/domain/use_cases/save_card_use_case.dart';

class InjectionController {
  final getIt = GetIt.instance;
  Future<void> initialize() async {
    getIt.registerLazySingleton<ApiService>(() => ApiService());

    // Register theme and language services with GetIt
    getIt.registerLazySingleton<ThemeService>(() => ThemeService());

    getIt.registerLazySingleton<LanguageService>(() => LanguageService());
    getIt.registerLazySingleton<NotificationService>(
      () => NotificationService(),
    );

    // Also register with GetX for widgets that use Get.find()
    Get.put(ThemeService(), permanent: true);
    Get.put(LanguageService(), permanent: true);
    Get.put(NotificationService(), permanent: true);

    getIt.registerLazySingleton<CashDataSource>(
      () => CashDataSource(
        // getIt(),
      ),
    );
    getIt.registerLazySingleton<SaveCardRemoteDataSource>(
      () => SaveCardRemoteDataSourceImpl(getIt()),
    );
    getIt.registerLazySingleton<DeleteCardRemoteDataSource>(
      () => DeleteCardRemoteDataSourceImpl(getIt()),
    );
    getIt.registerLazySingleton<GetCardRemoteDataSource>(
      () => GetCardRemoteDataSourceImpl(getIt()),
    );
    getIt.registerLazySingleton<DeleteCardRepo>(
      () => DeleteCardRepoImpl(getIt()),
    );
    getIt.registerLazySingleton<SaveCardRepo>(() => SaveCardRepoImpl(getIt()));
    getIt.registerLazySingleton<GetCardRepo>(() => GetCardRepoImpl(getIt()));
    getIt.registerLazySingleton<DeleteCardUseCase>(
      () => DeleteCardUseCase(getIt()),
    );
    getIt.registerLazySingleton<SaveCardUseCase>(
      () => SaveCardUseCase(getIt()),
    );
    getIt.registerLazySingleton<GetCardUseCase>(() => GetCardUseCase(getIt()));
    getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepoImpl(getIt()));
    getIt.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(getIt()));
    getIt.registerLazySingleton<SignUpRemoteDataSource>(
      () => SignUpRemoteDataSourceImpl(getIt()),
    );
    getIt.registerLazySingleton<LogInRepo>(() => LogInRepoImpl(getIt()));
    getIt.registerLazySingleton<LogInUseCase>(() => LogInUseCase(getIt()));
    getIt.registerLazySingleton<LogInRemoteDataSource>(
      () => LogInRemoteDataSourceImpl(getIt()),
    );
    getIt.registerLazySingleton<ForgetPasswordRepo>(
      () => ForgetPasswordRepoImpl(getIt()),
    );
    getIt.registerLazySingleton<ForgetPasswordUseCase>(
      () => ForgetPasswordUseCase(getIt()),
    );
    getIt.registerLazySingleton<ForgetPasswordRemoteDataSource>(
      () => ForgetPasswordRemoteDataSourceImpl(getIt()),
    );
  }
}
