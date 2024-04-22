import 'package:bitdrill/locator.dart';
import 'package:bitdrill/model/CompoundDailyIncomeModel.dart';
import 'package:bitdrill/providers/report_provider.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CompoundingDirectIncome extends StatefulWidget {
  const CompoundingDirectIncome({super.key});

  @override
  State<CompoundingDirectIncome> createState() => _CompoundingDirectIncomeState();
}

class _CompoundingDirectIncomeState extends State<CompoundingDirectIncome> {
  late double width;

  late double height;

  @override
  void initState() {
    // TODO: implement initState
    locator<ReportProvider>().sendcompoundDailyIncomeModel(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width =MediaQuery.sizeOf(context).width;
    height =MediaQuery.sizeOf(context).height;
    CompoundDailyIncomeModel? compoundDailyIncomeModel = Provider.of<ReportProvider>(context).compoundDailyIncomeModel;
    return Scaffold(
        appBar: customAppBar(title: 'Compounding Direct Income',backBtn: backBtn(context: context)),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: compoundDailyIncomeModel != null && compoundDailyIncomeModel.status != "0"?
          ListView.builder(
            itemCount: compoundDailyIncomeModel.dailyincome!.length,
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
                          child: black16Text('Sponsor Name: ${compoundDailyIncomeModel.dailyincome![index].name}',)),
                      black16Text('${compoundDailyIncomeModel.dailyincome![index].memberid
                      }',),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      blackLight14Text('${compoundDailyIncomeModel.dailyincome![index].incomeDate}',),
                      miniBrownContainer(text: '\$ ${compoundDailyIncomeModel.dailyincome![index].amount}'),
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
