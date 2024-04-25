import 'package:bitdrill/locator.dart';
import 'package:bitdrill/model/DepositeHistoryModel.dart';
import 'package:bitdrill/model/WithdrawalHistoryModel.dart';
import 'package:bitdrill/providers/report_provider.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class WithdrawalHistory extends StatefulWidget {
  const WithdrawalHistory({super.key});

  @override
  State<WithdrawalHistory> createState() => _WithdrawalHistoryState();
}

class _WithdrawalHistoryState extends State<WithdrawalHistory> {
  late double width;

  late double height;

  @override
  void initState() {
    // TODO: implement initState
    locator<ReportProvider>().getWithdrawalhistory(context);
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
    WithdrawalHistoryModel? withdrawalHistoryModel = Provider
        .of<ReportProvider>(context)
        .withdrawalHistoryModel;
    return Scaffold(
        appBar: customAppBar(
            title: withdrawalHistory, backBtn: backBtn(context: context)),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: withdrawalHistoryModel != null && withdrawalHistoryModel.status == "1"?
          ListView.builder(
            itemCount: withdrawalHistoryModel.data!.length,
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
                                'Member Details : ${withdrawalHistoryModel.data![index]
                                    .memberDetail}',)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              blackLight14Text('Request Amount : ${withdrawalHistoryModel
                                  .data![index].reqAmount}',),
                              blackLight14Text('Deduction Amount : ${withdrawalHistoryModel
                                  .data![index].deduction}',),
                              black16Text(
                                'Status : ${withdrawalHistoryModel.data![index].status}',),

                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              blackLight14Text('${withdrawalHistoryModel
                                  .data![index].requestDate}',),
                              blackLight14Text('Net Amount : ${withdrawalHistoryModel
                                  .data![index].netAmount}',),
                            ],
                          )

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
