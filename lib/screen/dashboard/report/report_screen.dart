import 'dart:ffi';

import 'package:bitdrill/screen/dashboard/report/componding_income.dart';
import 'package:bitdrill/screen/dashboard/report/compounding_direct_income.dart';
import 'package:bitdrill/screen/dashboard/report/direct_income_screen.dart';
import 'package:bitdrill/screen/dashboard/report/level_income_screen.dart';
import 'package:bitdrill/screen/dashboard/report/levelincomecompunding.dart';
import 'package:bitdrill/screen/dashboard/report/reward_status.dart';
import 'package:bitdrill/screen/dashboard/report/withdrwal_history.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';

import 'affiliate_bonus.dart';
import 'details_trade_profit.dart';
import 'ib_trade_bonus.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({super.key});

  late double height;
  late double width;

  List reportList = [
    {
      "title": dailyMining,
      'icon': const Icon(Icons.list_alt_outlined,color: Colors.white,),
      'nextPage': DailyTradeProfit()
    },
    {
      "title": directIncome,
      'icon': const Icon(Icons.request_page_outlined,color: Colors.white,),
      'nextPage': AffiliateBonus()
    },
    {
      "title": levelIncome,
      'icon': Icon(Icons.request_page_outlined,color: Colors.white,),
      'nextPage': IbTradeBonus()
    },
    {
      "title": compondingIncome,
      'icon': Icon(Icons.request_page_outlined,color: Colors.white,),
      'nextPage': WithdrawalListScreen()
    },
    {
      "title": compoundingDirectIncome,
      'icon': Icon(Icons.request_page_outlined,color: Colors.white,),
      'nextPage': RewardStatus()
    },
    {
      "title": compoundingLevelIncome,
      'icon': Icon(Icons.request_page_outlined,color: Colors.white,),
      'nextPage': RewardStatus()
    },
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      //appBar: customAppBar(title: report),
      body: SafeArea(
        child: Container(
          height: height,
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 05.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: reportList.length,
              itemBuilder: (context, index) => reportOptionContainer(
                  context: context,
                  icon: reportList[index]['icon'],
                  text: reportList[index]['title'],
                  nextScreen: reportList[index]['nextPage'], index:index),
            )),
      ),
    );
  }
}

reportOptionContainer(
    {required BuildContext context,
    required String text,
    required int index,
    required Widget nextScreen,
    Icon? icon}) {
  return GestureDetector(
    onTap: () {
      if(index == 0){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DailyTradeProfit(),));
      }else if (index == 1){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DirectIncomeScreen(),));
      }else if (index == 2){
        Navigator.push(context, MaterialPageRoute(builder: (context) => LevelIncomeScreen(),));
      }else if (index == 3){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CompondingIncome(),));
      }else if (index == 4){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CompoundingDirectIncome(),));
      }
      else if (index == 5){
        Navigator.push(context, MaterialPageRoute(builder: (context) => LevelIncomeCompounding(),));
      }

    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: MyAppTheme.cardBgSecColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon ??  Icon(Icons.book_online,color: MyAppTheme.whiteColor),
              const SizedBox(width: 10,),
              black14Text(text),
            ],
          ),

           Icon(Icons.arrow_forward_ios,color: MyAppTheme.whiteColor,)
        ],
      ),
    ),
  );
}
