
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:flutter/material.dart';

import 'screen/splash/splash.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: MyAppTheme.lightBlueColor,
        primarySwatch: Colors.cyan
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}