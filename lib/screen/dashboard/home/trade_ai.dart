import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/helpers/textfeilds.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class AccountActivation extends StatelessWidget {
  AccountActivation({super.key});

  late double height; 
  late double width;
  TextEditingController amountController = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    width =MediaQuery.sizeOf(context).width;
    height =MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(title: accountActivation, backBtn: backBtn(context: context)),
      body: Container(
        color: MyAppTheme.bgColor,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: height*0.04,),
                black26Text("\$ 298"),
                black16Text(activationBalance),
                whiteTextField(controller: amountController,hintText: enterAmount),
              ].map((e) => Padding(padding: EdgeInsets.symmetric(vertical: 5),child: e,)).toList(),
            ),

            SizedBox(
              width: width*.8,
              child: mainBtn(text: activate, onTap: (){}),
            )

          ],
        ),
      ),
    );
  }
}
