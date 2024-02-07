import 'package:bitdrill/screen/auth/signup.dart';
import 'package:bitdrill/utils/my_images.dart';
import 'package:flutter/material.dart';

import '../auth/signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn(),)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
