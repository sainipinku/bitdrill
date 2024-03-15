import 'package:bitdrill/locator.dart';
import 'package:bitdrill/providers/home_provider.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/helpers/textfeilds.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



p2pBottomSheet(BuildContext buildContext,String amount){
  TextEditingController memberIdController = TextEditingController();
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              black16Text(fundTransfer),

                            ],),
                          Row(
                            children: [
                              blackLight14Text("$balance :"),
                              brown14Text("\$ $amount")
                            ],
                          ),
                          const SizedBox(height: 20,),
                          whiteTextField(controller: memberIdController,hintText: enterYourMemberID),
                          const SizedBox(height: 10,),
                          whiteTextField(controller: amountController,
                              hintText: enterYourAmount
                          ),
                          const SizedBox(height: 10,),
                         /* whiteTextField(controller: otpController,
                              hintText: enterOTP
                          ),
                          const SizedBox(height: 10,),*/
                          Center(
                            child: mainBtn(
                                text: 'Send OTP',
                                width: 100,
                                onTap: (){

                                  locator<HomeProvider>().sendFundTransferHomeData(context,amountController.text);
                                }),
                          )
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
