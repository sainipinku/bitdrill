import 'package:bitdrill/locator.dart';
import 'package:bitdrill/model/InvestHistroyModel.dart';
import 'package:bitdrill/providers/report_provider.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class InvestHistory extends StatefulWidget {
  const InvestHistory({super.key});

  @override
  State<InvestHistory> createState() => _InvestHistoryState();
}

class _InvestHistoryState extends State<InvestHistory> {
  late double width;

  late double height;

  @override
  void initState() {
    // TODO: implement initState
    locator<ReportProvider>().getInvestHistroy(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width =MediaQuery.sizeOf(context).width;
    height =MediaQuery.sizeOf(context).height;
    InvestHistroyModel? investHistroyModel = Provider.of<ReportProvider>(context).investHistroyModel;
    return Scaffold(
        appBar: customAppBar(title: investHistory,backBtn: backBtn(context: context)),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: investHistroyModel != null ?
          ListView.builder(
            itemCount: investHistroyModel.data!.length,
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
                          child: black16Text('Member Name: ${investHistroyModel.data![index].memberName}',)),
                      black16Text('${investHistroyModel.data![index].memberid}',),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          blackLight14Text('${investHistroyModel.data![index].adddate}',),
                          blackLight14Text('Invest Type -${investHistroyModel.data![index].mstatus}',),
                        ],
                      ),
                      miniBrownContainer(text: '\$ ${investHistroyModel.data![index].investAmount}'),
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
