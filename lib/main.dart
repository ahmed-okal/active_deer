import 'package:active_deer/core/locale/locale.dart';
import 'package:active_deer/core/routes/app_pages.dart';
import 'package:active_deer/core/theme/app_themes.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:active_deer/injection_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await InjectionController().initialize();
  await initializeDateFormatting('en_US', null);
  await initializeDateFormatting('ar_EG', null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        AppSize.init(context);
        return GetMaterialApp(
          translations: MyLocale(),
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en', 'US'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
          theme: AppThemes.lightTheme,
          // darkTheme: AppThemes.darkTheme,
          // themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
