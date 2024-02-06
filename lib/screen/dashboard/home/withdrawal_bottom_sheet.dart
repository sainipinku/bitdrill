import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/helpers/textfeilds.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget withdrawalBottomSheet({
  required BuildContext context,
  required String amount,
}){
  TextEditingController amountController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  return Container(
    color: MyAppTheme.bgColor,
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: black16Text(withdrawal)),
                Row(
                  children: [
                    blackLight14Text("$balance :"),
                    brown14Text("\$ $amount")
                  ],
                ),
                blackLight14Text("Choose assets to withdraw"),

                const SizedBox(height: 10,),
                whiteTextField(controller: amountController,
                  hintText: enterYourAmount
                ),
                const SizedBox(height: 10,),
                whiteTextField(controller: otpController,
                    hintText: enterOTP
                ),
              ],
            ),
            Positioned(
              top: -10,
              right: 0,
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.cancel_outlined),
              iconSize: 35),
            )
          ],
        ),
      ],
    ),
  );
}