
import 'package:bitdrill/config/shared_prefs.dart';
import 'package:bitdrill/model/register_model.dart';
import 'package:bitdrill/screen/auth/signin.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/my_styles.dart';
import 'package:flutter/material.dart';

class RegisterDilogBox extends StatefulWidget {
  RegisterModel registerModel;
  RegisterDilogBox({Key? key,required this.registerModel}) : super(key: key);

  @override
  State<RegisterDilogBox> createState() => _RegisterDilogBoxState();
}

class _RegisterDilogBoxState extends State<RegisterDilogBox>  with SingleTickerProviderStateMixin{
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
              height: MediaQuery.of(context).size.height * 0.23,
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                  color: MyAppTheme.whiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${widget.registerModel.membername}',textAlign: TextAlign.center,style: MyStyles.blackk16BoldStyle,),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(backgroundColor: MyAppTheme.logoColor),
                            onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushAndRemoveUntil<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) => SignIn(),
                            ),
                                (route) => false,//if you want to disable back feature set to false
                          );
                        }, child: Text('Login',style: MyStyles.black16BoldStyle,))
                      ],
                    )
                  ],
                ),
              )
          ),

        ),
      ),
    );
  }
}
