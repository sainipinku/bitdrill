import 'package:bitdrill/locator.dart';
import 'package:bitdrill/model/DepositeHistoryModel.dart';
import 'package:bitdrill/model/InvestHistroyModel.dart';
import 'package:bitdrill/providers/report_provider.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepositeHistory extends StatefulWidget {
  const DepositeHistory({super.key});

  @override
  State<DepositeHistory> createState() => _DepositeHistoryState();
}

class _DepositeHistoryState extends State<DepositeHistory> {
  late double width;

  late double height;

  @override
  void initState() {
    // TODO: implement initState
    locator<ReportProvider>().getDepositehistory(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery
        .sizeOf(context)
        .width;
    height = MediaQuery
        .sizeOf(context)
        .height;
    DepositeHistoryModel? depositeHistoryModel = Provider
        .of<ReportProvider>(context)
        .depositeHistoryModel;
    return Scaffold(
        appBar: customAppBar(
            title: depositHistory, backBtn: backBtn(context: context)),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: depositeHistoryModel != null ?
          ListView.builder(
            itemCount: depositeHistoryModel.data!.length,
            itemBuilder: (context, index) =>
                Container(
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
                              width: width * 0.7,
                              child: black16Text(
                                'Member Id: ${depositeHistoryModel.data![index]
                                    .memberID}',)),
                          black16Text(
                            '${depositeHistoryModel.data![index].factor}',),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              blackLight14Text('${depositeHistoryModel
                                  .data![index].date}',),
                              blackLight14Text('${depositeHistoryModel
                                  .data![index].narration}',),
                              blackLight14Text('${depositeHistoryModel
                                  .data![index].balance}',),
                            ],
                          ),
                          miniBrownContainer(
                              text: '\$ ${depositeHistoryModel.data![index]
                                  .amount}'),
                        ],
                      ),
                    ],
                  ),
                ),

          ) : const Center(
            child: Text('No Record', style: TextStyle(color: Colors.white),),),
        )
    );
  }
}
