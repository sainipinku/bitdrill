import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class DailyTradeProfit extends StatelessWidget {
  DailyTradeProfit({super.key});

  late double width;
  late double height;

  @override
  Widget build(BuildContext context) {
    width =MediaQuery.sizeOf(context).width;
    height =MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: customAppBar(title: dailyTradeProfit,backBtn: backBtn(context: context)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 2,
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
                          child: black16Text('Member Name: Punit Lohani',)),
                      black16Text('258585',),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      blackLight14Text('03 Feb 2024',),
                      miniBrownContainer(text: '\$ 25'),
                    ],
                  ),
                ],
              ),
            ),

        ),
      )
    );
  }

  Future<List<TradeData>> fetchData() async {
    await Future.delayed(const Duration(seconds: 0)); //  delay

    return [
      TradeData(id: '122345', name: 'Shree ganeshay namah', date: '2024-02-03', amount: 5.0),
      TradeData(id: '567890', name: 'Shree ganeshay namahShree ganeshay namahShree ganeshay namahShree ganeshay namahShree ganeshay namahShree ganeshay namahShree ganeshay namahShree ganeshay namah', date: '2024-02-03', amount: 0.1),
      TradeData(id: '126445', name: 'Shree ganeshay namah', date: '2024-02-03', amount: 5.0),
      TradeData(id: '567850', name: 'Shree ganeshay namah', date: '2024-02-03', amount: 0.1),
      TradeData(id: '122345', name: 'Shree ganeshay namah', date: '2024-02-03', amount: 5.0),
      TradeData(id: '567890', name: 'Shree ganeshay namah', date: '2024-02-03', amount: 0.1),
      // Add more data as needed
    ];
  }
}

class TradeData {
  final String id;
  final String name;
  final String date;
  final double amount;

  TradeData({
    required this.id,
    required this.name,
    required this.date,
    required this.amount,
  });
}

/*
FutureBuilder<List<TradeData>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available.'));
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final tradeData = snapshot.data![index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: MyAppTheme.brownColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width*.7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /*style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),*/
                                Text('Member Name: ${tradeData.name}',),
                                Text('Date: ${tradeData.date}'),
                              ],
                            ),
                          ),
                          IntrinsicHeight(
                            child: SizedBox(
                              height: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text(
                                    ' ${tradeData.id}',
                                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                  ),

                                  priceContainer(price: tradeData.amount.toString())
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
*/
  