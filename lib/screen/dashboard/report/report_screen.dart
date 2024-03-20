import 'dart:ffi';

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
      "title": dailyTradeProfit,
      'icon': const Icon(Icons.list_alt_outlined),
      'nextPage': DailyTradeProfit()
    },
    {
      "title": affiliateBonus,
      'icon': const Icon(Icons.request_page_outlined),
      'nextPage': AffiliateBonus()
    },
    {
      "title": ibTradeBonus,
      'icon': Icon(Icons.request_page_outlined),
      'nextPage': IbTradeBonus()
    },
    {
      "title": withdrawalHistory,
      'icon': Icon(Icons.request_page_outlined),
      'nextPage': WithdrawalListScreen()
    },
    {
      "title": rewardStatus,
      'icon': Icon(Icons.request_page_outlined),
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: reportList.length,
              itemBuilder: (context, index) => reportOptionContainer(
                  context: context,
                  icon: reportList[index]['icon'],
                  text: reportList[index]['title'],
                  nextScreen: reportList[index]['nextPage']),
            )),
      ),
    );
  }
}

reportOptionContainer(
    {required BuildContext context,
    required String text,
    required Widget nextScreen,
    Icon? icon}) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => nextScreen,
          ));
    },
    child: Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 2),
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
