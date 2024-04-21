import 'package:bitdrill/locator.dart';
import 'package:bitdrill/model/DepositModel.dart';
import 'package:bitdrill/providers/home_provider.dart';
import 'package:bitdrill/repository/home_repositroy.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/helper.dart';
import 'package:bitdrill/utils/helpers/textfeilds.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/my_styles.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




depositBottomSheet(BuildContext buildContext,DepositModel depositModel){
  TextEditingController requestController = TextEditingController();
  TextEditingController transactionController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
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
                          Center(child: black16Text(deposit)),
                         /* Row(
                            children: [
                              blackLight14Text("$balance :"),
                            ],
                          ),*/
                          blackLight14Text("Choose assets to Deposit"),
                          const SizedBox(height: 10,),
                          black16Text('SEND ONLY BEP20.USDT TO THIS QR CODE/ADDRESS'),
                          Center(
                              child: FadeInImage(
                                image: NetworkImage('${depositModel.data![0].qrcodeurl}'),
                                placeholder: const AssetImage(
                                    "assets/images/image_defult.png"),
                                imageErrorBuilder: (context,
                                    error, stackTrace) {
                                  return Image.asset(
                                    "assets/images/image_defult.png",
                                  );
                                },
                              )
                          ),
                          const SizedBox(height: 10,),
                          blackLight14Text("Wallet Address"),
                          const SizedBox(height: 10,),
                          black16Text('${depositModel.data![0].walletAddress}'),
                          const SizedBox(height: 10,),
                          black16Text('Request Crypto'),
                          const SizedBox(height: 10,),
                          whiteTextField(controller: requestController,
                              hintText: 'Enter Your Request Crypto'
                          ),
                          black16Text('Transaction'),
                          const SizedBox(height: 10,),
                          whiteTextField(controller: transactionController,
                              hintText: 'Enter Your Transaction Hash'
                          ),
                          black16Text('Remark'),
                          const SizedBox(height: 10,),
                          whiteTextField(controller: remarkController,
                              hintText: 'Enter Your Remark'
                          ),
                          Center(
                            child: mainBtn(
                                text: 'Confirm',
                                width: 100,
                                onTap: (){

                                  locator<HomeProvider>().sendDepositHomeData(context,requestController.text,transactionController.text,remarkController.text);
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
