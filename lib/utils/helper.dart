import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'my_app_theme.dart';

class Helpers {
  static OverlayEntry overlayLoader(context) {
    OverlayEntry loader = OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      return Positioned(
        height: size.height,
        width: size.width,
        top: 0,
        left: 0,
        child: Material(
          color: MyAppTheme.blackColor.withOpacity(0.0),
          child: CircularLoadingWidget(height: 200),
        ),
      );
    });
    return loader;
  }

  static hideLoader(OverlayEntry loader) {
    Timer(const Duration(milliseconds: 100), () {
      try {
        loader.remove();
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    });
  }

  static messageToastFalse(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: MyAppTheme.audioGradient1,
        textColor: Colors.white,
        fontSize: 12.0);
  }

  static customMessageToastFalse(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: MyAppTheme.audioGradient1,
        textColor: Colors.white,
        fontSize: 12.0);
  }

  static createErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: MyAppTheme.errorColor,
      content: Text(
        message,
        style: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400),
      ),
    ));
  }

  /*static Future<bool> verifyInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }*/
  static String errorString(String errorList) {
    var parts = errorList.split('[');
    var prefix = parts[1].trim();
    var pre = prefix.split(']');
    var fix = pre[0].trim();
    debugPrint(fix);
    return fix;
  }
  static bool isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(email);
  }
}


class CircularLoadingWidget extends StatefulWidget {
  late double height=0.0;

  CircularLoadingWidget({Key? key, required this.height}) : super(key: key);

  @override
  CircularLoadingWidgetState createState() => CircularLoadingWidgetState();
}

class CircularLoadingWidgetState extends State<CircularLoadingWidget> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    CurvedAnimation curve = CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation = Tween<double>(begin: widget.height, end: 0).animate(curve)
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    Timer(const Duration(seconds: 10), () {
      if (mounted) {
        animationController.forward();
      }
    });
  }

  @override
  void dispose() {
// Timer(Duration(seconds: 30), () {
// //if (mounted) {
// //}
// });
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value / 100 > 1.0 ? 1.0 : animation.value / 100,
      child: SizedBox(
        height: animation.value,
        child: Center(
          child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(MyAppTheme.errorColor)),
        ),
      ),
    );
  }
}