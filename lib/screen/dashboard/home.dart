import 'dart:async';
import 'dart:convert';

import 'package:bitdrill/common_ui/common_container.dart';
import 'package:bitdrill/model/home_model.dart';
import 'package:bitdrill/repository/auth_repository.dart';
import 'package:bitdrill/utils/helper.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/my_images.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List banner = ['assets/images/Slider_01.jpg','assets/images/Slider_02.jpg','assets/images/Slider_03.jpg','assets/images/Slider_04.jpg'];
  late PageController _controller = PageController(
      viewportFraction: banner.length == 1 ? 1 : 0.80, initialPage: 0);
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
    getHomeData(context);
    super.initState();
  }
  HomeModel? homeModel;
  void getHomeData(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          homeData(context).then((response) {
            setState(() {
              homeModel = response;
            });
          });
        } else {
          Helpers.createErrorSnackBar(context, "Please check your internet connection");
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }
  void _animateSlider() {
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentIndex < banner.length) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      if (_controller.hasClients) {
        _controller.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: homeModel != null ?
        Container(
          height: height,
          width: width,
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width,
                  height: height * 0.25,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: width,
                        child: PageView.builder(
                          controller: _controller,
                          padEnds: false,
                          onPageChanged: (value) {
                            setState(() {
                              currentIndex = value;
                            });
                          },
                          itemCount: banner.length,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {

                              },
                              child:  SizedBox(
                                  height: height* 0.20,
                                  width: width,
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(5.0),
                                    child: Image.asset(banner[index]),
                                  )),
                            );

                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 2.0),
                          child: SmoothPageIndicator(
                              controller: _controller,
                              count: banner.length,
                              effect:  const ExpandingDotsEffect(
                                  radius: 8,
                                  spacing: 8,
                                  dotHeight: 8,
                                  dotWidth: 8,
                                  dotColor: Colors.black45,
                                  activeDotColor: Colors.black
                              )
                            /* const ScrollingDotsEffect(
                                                              radius: 8,
                                                              spacing: 8,
                                                              dotHeight: 8,
                                                              dotWidth: 8,
                                                              activeDotColor: MyAppTheme.MainColor)*/),
                        ),
                      )
                    ],
                  )
                ),
                Row(
                  children: [
                    Expanded(child: CommonContainer(height: height* 0.10, title: "Total Portfolio", value: "\$ ${homeModel!.dashboard![0].investAmount}")),
                    const SizedBox(width: 10,),
                    Expanded(child: CommonContainer(height: height* 0.10, title: "Performance 24 h", value: "\$ ${homeModel!.dashboard![0].todayIncome}"))
                  ],
                ),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: MyAppTheme.brownColor
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      innerContainerComponent(img: MyImages.thisProject,
                          title: withdrawal),
                      innerContainerComponent(img: MyImages.thisProject,
                          title: deposit),
                      innerContainerComponent(img: MyImages.thisProject,
                          title: p2p
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: MyAppTheme.lightBlueColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      blackLight12Text("$remainingLimit : \$ ${homeModel!.dashboard![0].totremain}"),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: LinearProgressIndicator(
                          backgroundColor: MyAppTheme.greyColor,
                          color: MyAppTheme.brownColor,
                          semanticsValue: '100',
                          minHeight: 15,
                          borderRadius: BorderRadius.circular(12),
                          value: .05
                        ),
                      ),

                      blackLight12Text("Total earned \$ ${homeModel!.dashboard![0].isTotalEarned} of investment"),
                    ],
                  ),
                ),

                mainBtn(text: tradeAll, onTap: (){}),
                Row(
                  children: [
                    Expanded(child: CommonContainer(height: height* 0.10, title: "Daily Trade Profit", value: "\$ ${homeModel!.dashboard![0].roi}")),
                    const SizedBox(width: 10,),
                    Expanded(child: CommonContainer(height: height* 0.10, title: "FastTrack Bonus", value: "\$ ${homeModel!.dashboard![0].isbooster}"))
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CommonContainer(height: height* 0.10, title: "Affiliate Bonus", value: "\$ ${homeModel!.dashboard![0].directincome}")),
                    const SizedBox(width: 10,),
                    Expanded(child: CommonContainer(height: height* 0.10, title: "IB Trade Bonus", value: "\$ ${homeModel!.dashboard![0].levelincome}"))
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CommonContainer(height: height* 0.10, title: "Weekly IB Bonus", value: "\$ ${homeModel!.dashboard![0].rewardincome}")),
                    const SizedBox(width: 10,),
                      Expanded(child: CommonContainer(height: height* 0.10, title: "Rank & Bonus", value: "\$ ${homeModel!.dashboard![0].royaltyincome}"))
                  ],
                ),
                black16Text(wallet),
                Row(
                  children: [
                    Expanded(child: CommonContainer(
                        height: height* 0.10,
                        title: "Main Wallet",
                        value: "\$ ${homeModel!.dashboard![0].workingCurrentBalance}",
                      widget: CircleAvatar(
                        foregroundImage: AssetImage(MyImages.thisProject),
                        radius: height*0.03,
                      ),
                    )),
                    const SizedBox(width: 10,),
                    Expanded(child: CommonContainer(
                      height: height* 0.10,
                      title: "Total Withdra",
                      value: "\$ ${homeModel!.dashboard![0].totWithdrawal}",
                      widget: CircleAvatar(
                        foregroundImage: AssetImage(MyImages.thisProject),
                        radius: height*0.03,
                      ),
                    )),
                  ],
                ),

                black16Text(income),
                Row(
                  children: [
                    Expanded(child: CommonContainer(
                        height: height* 0.10,
                        title: "Active Direct",
                        value: "\$ ${homeModel!.dashboard![0].directCountActiveTeam}",
                      widget: Icon(Icons.person,size: 35),
                    )),
                    const SizedBox(width: 10,),
                    Expanded(child: CommonContainer(
                      height: height* 0.10,
                      title: "Team Business",
                      value: "\$ ${homeModel!.dashboard![0].downlineActTeamCount}",
                      widget: Icon(Icons.person,size: 35),
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CommonContainer(
                      height: height* 0.10,
                      title: "Self Business",
                      value: "\$ ${homeModel!.dashboard![0].totalSelfBusiness}",
                      widget: Icon(Icons.person,size: 35),
                    )),
                    const SizedBox(width: 10,),
                    Expanded(child: CommonContainer(
                      height: height* 0.10,
                      title: "Total Team Busine",
                      value: "\$ ${homeModel!.dashboard![0].todayDownlineBusiness}",
                      widget: Icon(Icons.person,size: 35),
                    )),
                  ],
                ),

              ].map((e) => Padding(padding: EdgeInsets.symmetric(vertical: 4),child: e,)).toList(),
            ),
          ),
        ) : SizedBox(),
      ),
    );
  }

  innerContainerComponent(
  {
    required String img,
    required String title,
    VoidCallback? onTap,
  }
      ){
    var height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: onTap ?? (){},
      child: Column(
        children: [
          CircleAvatar(
            foregroundImage: AssetImage(img),
            radius: height*0.03,
          ),
          black12Text(title)
        ],
      ),
    );
  }

}
