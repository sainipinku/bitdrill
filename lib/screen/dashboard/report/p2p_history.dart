import 'package:bitdrill/locator.dart';
import 'package:bitdrill/model/P2PHistoryModel.dart';
import 'package:bitdrill/providers/report_provider.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class P2PHistory extends StatefulWidget {
  const P2PHistory({super.key});

  @override
  State<P2PHistory> createState() => _P2PHistoryState();
}

class _P2PHistoryState extends State<P2PHistory> {
  late double width;

  late double height;

  @override
  void initState() {
    // TODO: implement initState
    locator<ReportProvider>().getP2PHistory(context);
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
    P2PHistoryModel? p2pHistoryModel = Provider
        .of<ReportProvider>(context)
        .p2pHistoryModel;
    return Scaffold(
        appBar: customAppBar(
            title: p2pHistory, backBtn: backBtn(context: context)),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: p2pHistoryModel != null ?
          ListView.builder(
            itemCount: p2pHistoryModel.fundTransferHistory!.length,
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
                                'Member Id: ${p2pHistoryModel.fundTransferHistory![index]
                                    .memberid}',)),
                          black16Text(
                            '${p2pHistoryModel.fundTransferHistory![index].factor}',),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              blackLight14Text('${p2pHistoryModel.fundTransferHistory![index].createDate}',),
                              blackLight14Text('${p2pHistoryModel.fundTransferHistory![index].narration}',),
                            ],
                          ),
                          miniBrownContainer(
                              text: '\$ ${p2pHistoryModel.fundTransferHistory![index]
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
