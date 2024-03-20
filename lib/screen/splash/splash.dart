import 'dart:async';

import 'package:bitdrill/screen/auth/signup.dart';
import 'package:bitdrill/screen/dashboard/dashboard.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/my_images.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigationToScreen() async{
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userToken = prefs.getString('user_msrno') ?? '';
      if(userToken.isNotEmpty){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashBoard(),));
      }else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn(),));
      }

    } on Exception catch (e) {
    }
  }
  _startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, navigationToScreen);
  }
  @override
  void initState() {
    _startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppTheme.bgColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
            child:  CircleAvatar(
              foregroundImage: AssetImage(MyImages.thisProject),
              radius: MediaQuery.of(context).size.height*0.10,
            ),
        ),
      ),
    );
  }
}
