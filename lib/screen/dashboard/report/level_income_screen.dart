import 'package:bitdrill/locator.dart';
import 'package:bitdrill/model/LevelIncomeModel.dart';
import 'package:bitdrill/providers/home_provider.dart';
import 'package:bitdrill/providers/report_provider.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/helpers/textfeilds.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LevelIncomeScreen extends StatefulWidget {
  const LevelIncomeScreen({Key? key}) : super(key: key);

  @override
  State<LevelIncomeScreen> createState() => _LevelIncomeScreenState();
}

class _LevelIncomeScreenState extends State<LevelIncomeScreen> {
  bool focus = true;
  late double height;
  late double width;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    locator<ReportProvider>().getLevelIncomeData(context,'1');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    height =MediaQuery.sizeOf(context).height;
    width =MediaQuery.sizeOf(context).width;
    LevelIncomeModel? levelIncomeModel = Provider.of<ReportProvider>(context).levelIncomeModel;
    return Scaffold(
      appBar: customAppBar(title: 'Level Income',backBtn: backBtn(context: context)),
      body: Consumer<ReportProvider>(
        builder: (context, provider, child) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: whiteTextField(controller: searchController,
                            hintText: "Enter Level Number"
                        ),
                      ),
                      const SizedBox(width: 5,),
                      mainBtn(text: search,
                          width: width*.22,
                          onTap: (){
                            provider.getLevelIncomeData(context,searchController.text.toString().trim());
                          },borderRadius: 5),
                    ],
                  ),
                  levelIncomeModel != null ?
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: levelIncomeModel.levelincome!.length,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: MyAppTheme.brownColor),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: MyAppTheme.greyColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: MyAppTheme.brownColor)
                              ),
                              child: white20boldText('${index+1}'),

                            ),
                            const SizedBox(width: 8,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      black16Text('${levelIncomeModel.levelincome![index].firstname}'),
                                      black16Text('${levelIncomeModel.levelincome![index].memberid}'),
                                    ],
                                  ),
                                  black12Text('Amount : ${levelIncomeModel.levelincome![index].amount}'),
                                  black12Text('Add Date : ${levelIncomeModel.levelincome![index].addDate}'),
                                  black12Text('Level No : ${levelIncomeModel.levelincome![index].levelNo}'),
                                  black12Text('Sponsor Id : ${levelIncomeModel.levelincome![index].dueToid}'),
                                  black12Text('Sponsor Name : ${levelIncomeModel.levelincome![index].dueToMember}'),
                                ].map((e) => Padding(padding: const EdgeInsets.symmetric(vertical: 2),child: e,)).toList(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ) :
                  Center(child: Text('No Data',style: TextStyle(color: Colors.white),),)


                ],
              ),
            ),
          );
        },
      )
      ,
    );
  }
}
