import 'package:bitdrill/locator.dart';
import 'package:bitdrill/providers/home_provider.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/helpers/textfeilds.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/my_styles.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




withdrawalBottomSheet(BuildContext buildContext,String amount){
  TextEditingController amountController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  showModalBottomSheet<void>(
    context: buildContext,
    isScrollControlled: true,
    backgroundColor: MyAppTheme.bgColor,
    shape: const RoundedRectangleBorder( // <-- SEE HERE
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (BuildContext context) {
      return  SingleChildScrollView(
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Center(
            child: Padding(padding: EdgeInsets.all(20),
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
                         /* whiteTextField(controller: otpController,
                              hintText: enterOTP
                          ),*/
                          Center(
                            child: mainBtn(
                                text: 'Send OTP',
                                width: 100,
                                onTap: (){

                                  locator<HomeProvider>().sendWithdrawalHomeData(context,amountController.text);
                                }),
                          )
                          ,
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
              ),)
            ,
          ),
        )
        ,
      )

      ;
    },
  );
}
