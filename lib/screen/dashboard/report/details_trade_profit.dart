import 'package:bitdrill/locator.dart';
import 'package:bitdrill/model/DailyMiningModel.dart';
import 'package:bitdrill/providers/report_provider.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DailyTradeProfit extends StatefulWidget {
  DailyTradeProfit({super.key});

  @override
  State<DailyTradeProfit> createState() => _DailyTradeProfitState();
}

class _DailyTradeProfitState extends State<DailyTradeProfit> {
  late double width;

  late double height;

  @override
  void initState() {
    // TODO: implement initState
    locator<ReportProvider>().getDailyIncome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width =MediaQuery.sizeOf(context).width;
    height =MediaQuery.sizeOf(context).height;
    DailyMiningModel? dailyMiningModel = Provider.of<ReportProvider>(context).dailyMiningModel;
    return Scaffold(
      appBar: customAppBar(title: dailyMining,backBtn: backBtn(context: context)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: dailyMiningModel != null ?
        ListView.builder(
          itemCount: dailyMiningModel.dailyincome!.length,
          itemBuilder: (context, index) =>  Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: MyAppTheme.brownColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: width*0.7,
                          child: black16Text('Member Name: ${dailyMiningModel.dailyincome![index].name}',)),
                      black16Text('${dailyMiningModel.dailyincome![index].memberid}',),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      blackLight14Text('${dailyMiningModel.dailyincome![index].incomeDate}',),
                      miniBrownContainer(text: '\$ ${dailyMiningModel.dailyincome![index].amount}'),
                    ],
                  ),
                ],
              ),
            ),

        ) : const Center(child: Text('No Record',style: TextStyle(color: Colors.white),),),
      )
    );
  }

}


  