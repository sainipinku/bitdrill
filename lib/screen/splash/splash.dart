import 'package:bitdrill/screen/auth/signup.dart';
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
      body: Center(
        child: Container(color: Colors.red,height: 50,width: 50,),
      ),
    );
  }
}
