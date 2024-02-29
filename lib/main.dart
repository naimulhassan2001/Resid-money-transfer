import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/app_route/app_route.dart';
import 'helper/shared_preference_helper.dart';
import 'laguages.dart';
import 'services/notification_services.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'services/socket_services.dart';
import 'utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await initializeDateFormatting('en', null);

  SocketServices socketServices = SocketServices();
  NotificationService notificationService = NotificationService();
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
  await sharedPreferenceHelper.getSharedPreferenceData();
  notificationService.initLocalNotification();
  SharedPreferenceHelper.isLogIn ? socketServices.connectToSocket() : null;
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      designSize: const Size(393, 852),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.noTransition,
          locale: Locale(SharedPreferenceHelper.localizationLanguageCode,
              SharedPreferenceHelper.localizationCountryCode),
          fallbackLocale: const Locale("en", "US"),
          translations: Languages(),
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: AppColors.background,
          )),
          transitionDuration: const Duration(milliseconds: 200),
          initialRoute: AppRoute.splashScreen,
          navigatorKey: Get.key,
          getPages: AppRoute.routes,
        );
      },
    );
  }
}
