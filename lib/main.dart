
import 'package:bitdrill/locator.dart';
import 'package:bitdrill/providers/auth_provider.dart';
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
    /*  ChangeNotifierProvider(create: (context) => locator<ScoreCardProvider>()),*/
      ChangeNotifierProvider(create: (context) => AuthProvider(),builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },)
    ],);
  }
}