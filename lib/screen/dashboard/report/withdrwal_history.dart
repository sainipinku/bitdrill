import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class WithdrawalListScreen extends StatelessWidget {
  const WithdrawalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: withdrawalList,backBtn: backBtn(context: context)),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black26,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: blackLight14Text('Deduction: \$${300}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              blackLight12Text('Status: success'),
                              blackLight12Text('Date: 2 Feb 2024'),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              miniBrownContainer(text: "\$ 25"),
                            ],
                          )
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}

Future<List<WithdrawalData>> fetchWithdrawals() async {
  var currDate = DateTime.now();
  await Future.delayed(const Duration(seconds: 0)); // delay

  return [
    WithdrawalData(
      deduction: 30.0,
      status: 'Success',
      date: currDate,
    ),
    WithdrawalData(
      deduction: 50.0,
      status: 'Pending',
      date: currDate,
    ),
    WithdrawalData(
      deduction: 20.0,
      status: 'Failed',
      date: DateTime.now(),
    ),
    WithdrawalData(
      deduction: 20.0,
      status: 'Failed',
      date: DateTime.now(),
    ),
    WithdrawalData(
      deduction: 20.0,
      status: 'Failed',
      date: DateTime.now(),
    ),
    WithdrawalData(
      deduction: 20.0,
      status: 'Failed',
      date: DateTime.now(),
    ),
    WithdrawalData(
      deduction: 20.0,
      status: 'Failed',
      date: DateTime.now(),
    ),

  ];
}

class WithdrawalData {
  final double deduction;
  final String status;
  final DateTime date;

  WithdrawalData({
    required this.deduction,
    required this.status,
    required this.date,
  });
}
