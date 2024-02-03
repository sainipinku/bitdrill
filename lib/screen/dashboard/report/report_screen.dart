import 'dart:ffi';

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
      'icon': Icon(Icons.request_page_outlined),
      'nextPage': DailyTradeProfit()
    },
    {
      "title": dailyTradeProfit,
      'icon': Icon(Icons.request_page_outlined),
      'nextPage': DailyTradeProfit()
    },
    {
      "title": dailyTradeProfit,
      'icon': Icon(Icons.request_page_outlined),
      'nextPage': DailyTradeProfit()
    },
    {
      "title": dailyTradeProfit,
      'icon': Icon(Icons.request_page_outlined),
      'nextPage': DailyTradeProfit()
    },
    {
      "title": dailyTradeProfit,
      'icon': Icon(Icons.request_page_outlined),
      'nextPage': DailyTradeProfit()
    },
    {
      "title": dailyTradeProfit,
      'icon': Icon(Icons.request_page_outlined),
      'nextPage': DailyTradeProfit()
    },
    {
      "title": dailyTradeProfit,
      'icon': Icon(Icons.request_page_outlined),
      'nextPage': DailyTradeProfit()
    },
    {
      "title": dailyTradeProfit,
      'icon': Icon(Icons.request_page_outlined),
      'nextPage': DailyTradeProfit()
    },
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(

        title: white16BoldText('Report'),
        centerTitle: true,
        leading: const SizedBox.shrink(),
        backgroundColor: MyAppTheme.brownColor,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Container(
          //   padding: const EdgeInsets.only(top: 30, left: 5),
          //   alignment: Alignment.center,
          //   width: width,
          //   height: height * .12,
          //   color: MyAppTheme.brownColor,
          //   child: Stack(
          //     children: [
          //       Align(
          //         alignment: Alignment.centerLeft,
          //         child: backBtn(context: context),
          //       ),
          //       Align(
          //         alignment: Alignment.center,
          //         child: white16BoldText('Report'),
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: reportList.length,
                itemBuilder: (context, index) => reportOptionContainer(
                    context: context,
                    text: reportList[index]['title'],
                    nextScreen: reportList[index]['nextPage']),
              )),
        ],
      ),
    );
  }
}

reportOptionContainer(
    {required BuildContext context,
    required String text,
    required Widget nextScreen,
    IconData? icon}) {
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
      color: MyAppTheme.lightBlueColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.book_online),
          black14Text(text),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    ),
  );
}
