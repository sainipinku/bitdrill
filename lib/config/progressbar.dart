import 'package:flutter/material.dart';

class Progressbar extends StatelessWidget {
  const Progressbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:
        CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Colors.red)),
      ),
    );
  }
}