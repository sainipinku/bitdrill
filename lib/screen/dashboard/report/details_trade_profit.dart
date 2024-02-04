import 'package:bitdrill/utils/constants.dart';
import 'package:flutter/material.dart';

class DailyTradeProfit extends StatelessWidget {
  const DailyTradeProfit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily Trade Profit',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF350304),
      ),
      body: FutureBuilder<List<TradeData>>(
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
                        color: Colors.black26,
                        width: 1,
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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                ' ${tradeData.id}',
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),

                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF340402),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 4),
                                    Text(
                                      '\$ ${tradeData.amount}',
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
  