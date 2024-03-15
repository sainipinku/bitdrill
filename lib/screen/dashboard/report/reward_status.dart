import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class RewardStatus extends StatelessWidget {
  const RewardStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: rewardStatus,backBtn: backBtn(context: context)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: black14Text('Level Name: Reword-1',)),
                        black14Text('Reward: 50',),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    blackLight14Text('LeftBiz: 1000.00'),
                    blackLight14Text('RightBiz: 1000.00'),
                    blackLight14Text('Remain Left Biz: 0.00'),
                    blackLight14Text('Remain Right Biz: 0.00'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        miniBrownContainer(text: 'Achieved')
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Future<List<RewardData>> fetchData() async {
  await Future.delayed(const Duration(seconds: 0)); // delay

  return [
    RewardData(
      name: "Reward-1",
      leftbiz: "2500.00",
      rewardamount: "50",
      rightbiz: "2500.00",
      remainleftbiz: "0.00",
      remainrightbiz: "0.00",
    ),
    RewardData(
      name: "Reward-2",
      leftbiz: "1000.00",
      rewardamount: "100",
      rightbiz: "1000.00",
      remainleftbiz: "0.00",
      remainrightbiz: "0.00",
    ),
    RewardData(
      name: "Reward-3",
      leftbiz: "3000.00",
      rewardamount: "150",
      rightbiz: "3000.00",
      remainleftbiz: "0.00",
      remainrightbiz: "0.00",
    ),
    RewardData(
      name: "Reward-4",
      leftbiz: "3000.00",
      rewardamount: "150",
      rightbiz: "3000.00",
      remainleftbiz: "0.00",
      remainrightbiz: "0.00",
    ),
    RewardData(
      name: "Reward-5",
      leftbiz: "3000.00",
      rewardamount: "150",
      rightbiz: "3000.00",
      remainleftbiz: "0.00",
      remainrightbiz: "0.00",
    ),
    RewardData(
      name: "Reward-6",
      leftbiz: "3000.00",
      rewardamount: "150",
      rightbiz: "3000.00",
      remainleftbiz: "0.00",
      remainrightbiz: "0.00",
    ),
    // Add more data as needed
  ];
}

class RewardData {
  final String name;
  final String rewardamount;
  final String leftbiz;
  final String rightbiz;
  final String remainleftbiz;
  final String remainrightbiz;

  RewardData({
    required this.rewardamount,
    required this.name,
    required this.leftbiz,
    required this.rightbiz,
    required this.remainleftbiz,
    required this.remainrightbiz,
  });
}
