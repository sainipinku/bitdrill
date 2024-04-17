
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/my_styles.dart';
import 'package:flutter/material.dart';

class ShowDilogBox extends StatefulWidget {
  String message;
  ShowDilogBox({Key? key,required this.message}) : super(key: key);

  @override
  State<ShowDilogBox> createState() => _ShowDilogBoxState();
}

class _ShowDilogBoxState extends State<ShowDilogBox>  with SingleTickerProviderStateMixin{
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
            height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width,
            decoration: ShapeDecoration(
                color: MyAppTheme.whiteColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            child: Center(
              child: Text(widget.message,style: MyStyles.blackk16BoldStyle,),
            ),
          ),

        ),
      ),
    );
  }
}
