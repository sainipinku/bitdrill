import 'package:bitdrill/utils/helpers/textfeilds.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    height =MediaQuery.sizeOf(context).height;
    width =MediaQuery.sizeOf(context).width;

    return Scaffold(
      //appBar: customAppBar(title: teamLevel),
      body: SafeArea(
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
                    });
                  },focus: focus,borderRadius: 20),

                  mainBtn(text: inActive,
                      width: width*.35,
                      onTap: (){
                    setState(() {
                      focus = false;
                    });
                  },focus: !focus,borderRadius: 20),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: whiteTextField(controller: searchController,
                      hintText: searchStatus
                    ),
                  ),
                  const SizedBox(width: 5,),
                  mainBtn(text: search,
                      width: width*.22,
                      onTap: (){},borderRadius: 20),
                ],
              ),


              ListView.builder(
                shrinkWrap: true,
                itemCount: detailsData.length,
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
                        child: white20boldText('1'),

                      ),
                      const SizedBox(width: 8,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                black16Text('${detailsData[index]['name']}'),
                                black16Text('${detailsData[index]['id']}'),
                              ],
                            ),
                            black12Text('DOJ : ${detailsData[index]['doj']}'),
                            black12Text('${detailsData[index]['email']}'),
                            black12Text('Status : ${detailsData[index]['status']}'),
                            black12Text('MobileNo : ${detailsData[index]['mobile']}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                black12Text('DOA : ${detailsData[index]['doa']}'),

                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: MyAppTheme.brownColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: white14BoldText(
                                    '\$ ${detailsData[index]['amount']}',
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
              )


            ],
          ),
        ),
      ),
    );
  }
}
