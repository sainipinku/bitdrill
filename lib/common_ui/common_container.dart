import 'package:flutter/material.dart';


class CommonContainer extends StatelessWidget {
  final double height ;
  final Color color;
  final String title;
  final String value;
  const CommonContainer({Key? key,required this.height,required this.color,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       height: height,
       decoration: BoxDecoration(
           color: color,
         borderRadius: BorderRadius.all(Radius.circular(08),)
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text(title),
           Text(value)
         ],
       ),
    );
  }
}
