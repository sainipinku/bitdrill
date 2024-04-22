import 'package:bitdrill/locator.dart';
import 'package:bitdrill/model/CompoundDailyIncomeModel.dart';
import 'package:bitdrill/model/DirectIncomeCompoundModel.dart';
import 'package:bitdrill/providers/report_provider.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CompondingIncome extends StatefulWidget {
  const CompondingIncome({super.key});

  @override
  State<CompondingIncome> createState() => _CompondingIncomeState();
}

class _CompondingIncomeState extends State<CompondingIncome> {
  late double width;

  late double height;

  @override
  void initState() {
    // TODO: implement initState
    locator<ReportProvider>().sendDirectIncomeCompoundModel(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width =MediaQuery.sizeOf(context).width;
    height =MediaQuery.sizeOf(context).height;
    DirectIncomeCompoundModel? directIncomeCompoundModel = Provider.of<ReportProvider>(context).directIncomeCompoundModel;
    return Scaffold(
        appBar: customAppBar(title: 'Compounding Income',backBtn: backBtn(context: context)),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: directIncomeCompoundModel != null && directIncomeCompoundModel.status != "0"?
          ListView.builder(
            itemCount: directIncomeCompoundModel!.data!.length,
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
                          child: black16Text('Member Name: ${directIncomeCompoundModel!.data![index].sponsorname}',)),
                      black16Text('${directIncomeCompoundModel!.data![index].sponsorid}',),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      blackLight14Text('${directIncomeCompoundModel!.data![index].addDate}',),
                      miniBrownContainer(text: '\$ ${directIncomeCompoundModel!.data![index].amount}'),
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
