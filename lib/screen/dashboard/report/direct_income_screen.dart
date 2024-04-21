import 'package:bitdrill/locator.dart';
import 'package:bitdrill/model/DirectIncomeModel.dart';
import 'package:bitdrill/providers/report_provider.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DirectIncomeScreen extends StatefulWidget {
  const DirectIncomeScreen({Key? key}) : super(key: key);

  @override
  State<DirectIncomeScreen> createState() => _DirectIncomeScreenState();
}

class _DirectIncomeScreenState extends State<DirectIncomeScreen> {
  late double width;

  late double height;

  @override
  void initState() {
    // TODO: implement initState
    locator<ReportProvider>().getDirectIncome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width =MediaQuery.sizeOf(context).width;
    height =MediaQuery.sizeOf(context).height;
    DirectIncomeModel? directIncomeModel = Provider.of<ReportProvider>(context).directIncomeModel;
    return Scaffold(
        appBar: customAppBar(title: 'Direct Income',backBtn: backBtn(context: context)),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: directIncomeModel != null ?
          ListView.builder(
            itemCount: directIncomeModel.data!.length,
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
                          child: black16Text('Sponsor Name: ${directIncomeModel.data![index].sponsorname}',)),
                      black16Text('${directIncomeModel.data![index].sponsorid
                      }',),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      blackLight14Text('${directIncomeModel.data![index].addDate}',),
                      miniBrownContainer(text: '\$ ${directIncomeModel.data![index].amount}'),
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
