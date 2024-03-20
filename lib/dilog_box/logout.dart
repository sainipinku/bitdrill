
import 'package:bitdrill/config/shared_prefs.dart';
import 'package:bitdrill/screen/auth/signin.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/my_styles.dart';
import 'package:flutter/material.dart';

class LogoutDilogBox extends StatefulWidget {
  LogoutDilogBox({Key? key}) : super(key: key);

  @override
  State<LogoutDilogBox> createState() => _LogoutDilogBoxState();
}

class _LogoutDilogBoxState extends State<LogoutDilogBox>  with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 40));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width,
            decoration: ShapeDecoration(
                color: MyAppTheme.whiteColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Logout ?',style: MyStyles.blackk20BoldStyle,),
                SizedBox(height: 10,),
                Text('Are You Sure You Want to Logout',style: MyStyles.blackk16BoldStyle,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: MyAppTheme.redBtnColor),
                        onPressed: () {
                      Navigator.pop(context);
                    }, child: Text('Cancel',style: MyStyles.black16BoldStyle,)),
                    TextButton(
                        style: TextButton.styleFrom(backgroundColor: MyAppTheme.logoColor),
                        onPressed: () {
                      Navigator.pop(context);
                      SharedPrefs.removeAll();
                      Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => SignIn(),
                        ),
                            (route) => false,//if you want to disable back feature set to false
                      );
                    }, child: Text('Logout',style: MyStyles.black16BoldStyle,))
                  ],
                )
              ],
            )
          ),

        ),
      ),
    );
  }
}
