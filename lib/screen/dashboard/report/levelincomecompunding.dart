import 'package:bitdrill/locator.dart';
import 'package:bitdrill/model/LevelIncomeCompundingModel.dart';
import 'package:bitdrill/providers/report_provider.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/helpers/textfeilds.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LevelIncomeCompounding extends StatefulWidget {
  const LevelIncomeCompounding({super.key});

  @override
  State<LevelIncomeCompounding> createState() => _LevelIncomeCompoundingState();
}

class _LevelIncomeCompoundingState extends State<LevelIncomeCompounding> {
  bool focus = true;
  late double height;
  late double width;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    locator<ReportProvider>().getLevelincomecompunding(context,'1');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    height =MediaQuery.sizeOf(context).height;
    width =MediaQuery.sizeOf(context).width;
    LevelIncomeCompundingModel? levelIncomeCompundingModel = Provider.of<ReportProvider>(context).levelIncomeCompundingModel;
    return Scaffold(
      appBar: customAppBar(title: 'Compounding Level Income',backBtn: backBtn(context: context)),
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
                            provider.getLevelincomecompunding(context,searchController.text.toString().trim());
                          },borderRadius: 5),
                    ],
                  ),
                  levelIncomeCompundingModel != null ?
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: levelIncomeCompundingModel.levelincome!.length,
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
                                      black16Text('${levelIncomeCompundingModel.levelincome![index].firstname}'),
                                      black16Text('${levelIncomeCompundingModel.levelincome![index].memberid}'),
                                    ],
                                  ),
                                  black12Text('Amount : ${levelIncomeCompundingModel.levelincome![index].amount}'),
                                  black12Text('Add Date : ${levelIncomeCompundingModel.levelincome![index].addDate}'),
                                  black12Text('Level No : ${levelIncomeCompundingModel.levelincome![index].levelNo}'),
                                  black12Text('Sponsor Id : ${levelIncomeCompundingModel.levelincome![index].dueToid}'),
                                  black12Text('Sponsor Name : ${levelIncomeCompundingModel.levelincome![index].dueToMember}'),
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
