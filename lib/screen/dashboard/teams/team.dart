import 'package:bitdrill/locator.dart';
import 'package:bitdrill/model/TypeModel.dart';
import 'package:bitdrill/providers/home_provider.dart';
import 'package:bitdrill/utils/helpers/textfeilds.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants.dart';


class Team extends StatefulWidget {
  const Team({Key? key}) : super(key: key);

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  bool focus = true;
  late double height;
  late double width;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  List detailsData =[{
    'id' : '987654',
    'amount' : '987654',
    'name' : "Punit Lohani",
    'doj' : "10 sep 2023",
    'email' : "punit@gmail.com",
    'mobile' : '9876532104',
    'doa' : '11 sep 2023'
  },{
    'id' : '987654',
    'amount' : '987654',
    'name' : "Punit Lohani",
    'doj' : "10 sep 2023",
    'email' : "punit@gmail.com",
    'mobile' : '9876532104',
    'doa' : '11 sep 2023'
  },];
  String status = '1';
  @override
  Widget build(BuildContext context) {
    height =MediaQuery.sizeOf(context).height;
    width =MediaQuery.sizeOf(context).width;
    TypeModel? typeModel = Provider.of<HomeProvider>(context).typeModel;
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      mainBtn(text: active,
                          width: width*.35,
                          onTap: (){
                            setState(() {
                              focus = true;
                              status = '1';
                            });
                          },focus: focus,borderRadius: 20),

                      mainBtn(text: inActive,
                          width: width*.35,
                          onTap: (){
                            setState(() {
                              focus = false;
                              status = '2';
                            });
                          },focus: !focus,borderRadius: 20),
                    ],
                  ),
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
                           provider.sendlevelNoData(context,status,searchController.text.toString().trim());
                          },borderRadius: 5),
                    ],
                  ),
                  typeModel != null ?
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: typeModel.data!.length,
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
                                      black16Text('${typeModel.data![index].firstname}'),
                                      black16Text('${typeModel.data![index].memberid}'),
                                    ],
                                  ),
                                  black12Text('DOJ : ${typeModel.data![index].doj}'),
                                  black12Text('Email id : ${typeModel.data![index].email}'),
                                  black12Text('Status : ${typeModel.data![index].memberStatus}'),
                                  black12Text('MobileNo : ${typeModel.data![index].mobile}'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      black12Text('DOA : ${typeModel.data![index].doa}'),

                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: MyAppTheme.cardBgSecColor,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: white14BoldText(
                                          '\$ ${typeModel.data![index].packageName}',
                                        ),
                                      ),
                                    ],
                                  ),
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
