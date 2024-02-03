import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';


class CommonContainer extends StatelessWidget {
  final double height ;
  final Color? color;
  final String title;
  final String value;
  final Widget? widget;
  final VoidCallback? onTap;
  const CommonContainer({Key? key,required this.height, this.color,
    this.widget,
    required this.title,required this.value,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? (){},
      child: Container(
         height: height,
         decoration: BoxDecoration(
             color: color ?? MyAppTheme.lightBlueColor,
           boxShadow: [
             BoxShadow(color: MyAppTheme.greyColor,blurRadius: 3,offset: const Offset(5, 5))
           ],
           borderRadius: const BorderRadius.all(Radius.circular(8),)
         ),
         child: (widget != null) ?Row(
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: widget ?? const SizedBox.shrink(),
             ),
             Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 black14Text(title),
                 black14Text(value)
               ],
             ),
           ],
         ):Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             black14Text(title),
             black14Text(value)
           ],
         ),
      ),
    );
  }
}
