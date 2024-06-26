
import 'package:bitdrill/locator.dart';
import 'package:bitdrill/providers/auth_provider.dart';
import 'package:bitdrill/providers/home_provider.dart';
import 'package:bitdrill/providers/profile_provider.dart';
import 'package:bitdrill/providers/report_provider.dart';

import 'package:bitdrill/utils/my_app_theme.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/splash/splash.dart';

void main(){
  setUpLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => locator<HomeProvider>()),
      ChangeNotifierProvider(create: (context) => locator<ProfileProvider>()),
      ChangeNotifierProvider(create: (context) => locator<ReportProvider>()),
      ChangeNotifierProvider(create: (context) => AuthProvider(),builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: MyAppTheme.bgColor,
            useMaterial3: false,
          ),
          home: SplashScreen(),
        );
      },)
    ],);
  }
}