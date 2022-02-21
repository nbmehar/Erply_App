import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:erply_login/constants/app_colors.dart';
import 'package:erply_login/providers/create_account_provider.dart';
import 'package:erply_login/providers/customer_provider.dart';
import 'package:erply_login/providers/login_provider.dart';
import 'package:erply_login/providers/settings_provider.dart';
import 'package:erply_login/providers/work_order_provider.dart';
import 'package:erply_login/views/auth/login_screen.dart';
import 'package:erply_login/views/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'providers/schedule_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => CreateAccountProvider()),
    ChangeNotifierProvider(create: (_) => ScheduleProvider()),
    ChangeNotifierProvider(create: (_) => CustomerProvider()),
    ChangeNotifierProvider(create: (_) => SettingsProvider()),
    ChangeNotifierProvider(create: (_) => WorkOrderProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(375, 812),
        builder: () {
          return MaterialApp(
            title: 'login-form',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                dividerColor: AppColors.white.withOpacity(0.1),
                errorColor: AppColors.redColor,
                scaffoldBackgroundColor: AppColors.darkBlueGrey),
            // home: Splash(),
            //Changed For Now
            home: Login(),
          );
        });
  }
}
