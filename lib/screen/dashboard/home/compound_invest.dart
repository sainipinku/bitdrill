import 'dart:convert';

import 'package:bitdrill/model/ActivationModel.dart';
import 'package:bitdrill/model/PackegaIdModel.dart';
import 'package:bitdrill/providers/home_provider.dart';
import 'package:bitdrill/repository/home_repositroy.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/helper.dart';
import 'package:bitdrill/utils/helpers/textfeilds.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompoundInvest extends StatefulWidget {
  final String amount;
  const CompoundInvest({Key? key,required this.amount}) : super(key: key);

  @override
  State<CompoundInvest> createState() => _CompoundInvestState();
}

class _CompoundInvestState extends State<CompoundInvest> {
  late double height;

  late double width;

  TextEditingController amountController = TextEditingController();

  var selectedPackageId;
  var packageId;
  PackegaIdModel? packegaIdModel;
  List<dynamic> packegeid = [];
  @override
  void initState() {
    // TODO: implement initState
    getHomeData(context);
    super.initState();
  }

  void getHomeData(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          compoundpackageIdhomeData(context).then((response) {
            setState(() {
              if(json.decode(response.body)['status'] == 1){
                packegeid = json.decode(response.body)['packagelist'];
              }else {
                Helpers.createErrorSnackBar(context,'User Not Exit');
              }

            });
          });
        } else {
          Helpers.createErrorSnackBar(context, "Please check your internet connection");
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }
  @override
  Widget build(BuildContext context) {
    width =MediaQuery.sizeOf(context).width;
    height =MediaQuery.sizeOf(context).height;
    ActivationModel? activationModel = Provider.of<HomeProvider>(context).activationModel;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(title: accountActivation, backBtn: backBtn(context: context)),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return Container(
            color: MyAppTheme.bgColor,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: height*0.04,),
                    activationModel == null ? black26Text("\$ ${widget.amount}"):  black26Text("\$ ${activationModel?.investamount}"),
                    black16Text(activationBalance),
                    Container(
                      width: width,
                      margin: const EdgeInsets.only(top: 2.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: MyAppTheme.cardBgSecColor,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(5))
                      ),
                      child:   DropdownButtonHideUnderline(
                        child: Theme(data: Theme.of(context).copyWith(
                          canvasColor: Colors.white,
                        ), child: CustomSearchableDropDown(
                          dropdownBackgroundColor: Colors.white,
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          items: packegeid,
                          label:  selectedPackageId ?? 'Packege Id',
                          primaryColor: Colors.black,
                          dropdownItemStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          dropDownMenuItems: packegeid.map((item) {
                            return item['packagename'];
                          }).toList() ??
                              [],
                          onChanged: (value){
                            if(value!=null)
                            {
                              print(value);
                              packageId = value['packageid'].toString();

                            }

                          },
                        ))
                        ,
                      ),
                    ),
                    whiteTextField(controller: amountController,hintText: enterAmount),
                  ].map((e) => Padding(padding: EdgeInsets.symmetric(vertical: 5),child: e,)).toList(),
                ),

                SizedBox(
                  width: width,
                  child: mainBtn(text: componding, onTap: (){
                    provider.sendCompoundingHomeData(context,amountController.text,packageId);
                  }),
                )

              ],
            ),
          );
        },
      ),
    );
  }
}
