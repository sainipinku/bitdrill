import 'dart:async';
import 'dart:convert';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:bitdrill/common_ui/common_container.dart';
import 'package:bitdrill/locator.dart';
import 'package:bitdrill/model/DepositModel.dart';
import 'package:bitdrill/model/LastClosingModel.dart';
import 'package:bitdrill/model/home_model.dart';
import 'package:bitdrill/providers/home_provider.dart';
import 'package:bitdrill/repository/auth_repository.dart';
import 'package:bitdrill/screen/dashboard/home/compound_invest.dart';
import 'package:bitdrill/screen/dashboard/home/depositBottomSheet.dart';
import 'package:bitdrill/utils/helper.dart';
import 'package:bitdrill/screen/dashboard/home/p2p_btm_sheet.dart';
import 'package:bitdrill/screen/dashboard/home/trade_ai.dart';
import 'package:bitdrill/screen/dashboard/home/withdrawal_bottom_sheet.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/my_images.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool positive = false;
  List banner = [
    'assets/images/Slider_01.jpg',
    'assets/images/Slider_02.jpg',
    'assets/images/Slider_03.jpg',
    'assets/images/Slider_04.jpg'
  ];
  late PageController _controller = PageController(
      viewportFraction: banner.length == 1 ? 1 : 0.80, initialPage: 0);
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
    locator<HomeProvider>().getHomeData(context);
    locator<HomeProvider>().getLastClosingDat(context);
    locator<HomeProvider>().getttDepositDetailsHomeData(context);
    super.initState();
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
  void dispose() {
    locator<HomeProvider>().timerClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isLoading = Provider.of<HomeProvider>(context).isLoading;
    HomeModel? homeModel = Provider.of<HomeProvider>(context).homeModel;
    int reminingTime = Provider.of<HomeProvider>(context).reminingTime;
    String? mStatus = Provider.of<HomeProvider>(context).mStatus;
    DepositModel? depositModel = Provider.of<HomeProvider>(context).depositModel;
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return Container(
            height: height,
            width: width,
            child: Stack(
              children: [
                SafeArea(
                  child: homeModel != null
                      ? Consumer<HomeProvider>(
                    builder: (context, provider, child) {
                      return Container(
                        height: height,
                        width: width,
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
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
                                              onTap: () {},
                                              child: SizedBox(
                                                  height: height * 0.20,
                                                  width: width,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5.0),
                                                    child: Image.asset(
                                                        banner[index]),
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
                                              effect:
                                              const ExpandingDotsEffect(
                                                  radius: 8,
                                                  spacing: 8,
                                                  dotHeight: 8,
                                                  dotWidth: 8,
                                                  dotColor:
                                                  Colors.white54,
                                                  activeDotColor:
                                                  Colors.white)
                                            /* const ScrollingDotsEffect(
                                                                    radius: 8,
                                                                    spacing: 8,
                                                                    dotHeight: 8,
                                                                    dotWidth: 8,
                                                                    activeDotColor: MyAppTheme.MainColor)*/
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Row(
                                children: [
                                  Expanded(
                                      child: CommonContainer(
                                          height: height * 0.10,
                                          title: "Total Portfolio",
                                          value:
                                          "\$ ${homeModel!.dashboard![0].investAmount}")),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: CommonContainer(
                                          height: height * 0.10,
                                          title: "Performance 24 h",
                                          value:
                                          "\$ ${homeModel!.dashboard![0].todayIncome}"))
                                ],
                              ),
                              Center(child: Text('Tap to Mine',style: TextStyle(color: Colors.white),)),
                              Center(
                                child: AnimatedToggleSwitch<bool>.dual(
                                  current: reminingTime <= 6 && mStatus == 'Active' ? true : false,
                                  first: false,
                                  second: true,
                                  spacing: 50.0,
                                  style:  ToggleStyle(
                                    backgroundColor: MyAppTheme.cardBgSecColor,
                                    borderColor: Colors.transparent,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(0, 1.5),
                                      ),
                                    ],
                                  ),
                                  borderWidth: 5.0,
                                  height: 55,
                                  onChanged: (b) => setState(() => {
                                    if(reminingTime >= 6 && mStatus == 'Active'){
                                      provider.sendCenterHomeData(context),
                                      positive = b
                                    }

                                  }),
                                  styleBuilder: (b) =>
                                      ToggleStyle(indicatorColor: b ? Colors.red : Colors.green),
                                  iconBuilder: (value) => value
                                      ? Center(child: Text('No',style: TextStyle(color: Colors.white),))
                                      : Center(child: Text('Yes',style: TextStyle(color: Colors.white))),
                                  textBuilder: (value) => value
                                      ? Center(child: Text('${_formatTime(int.parse('${(provider.hours)-(provider.ghours)}'))}:${_formatTime(int.parse('${(provider.minutes)-(provider.gminutes)}'))}:${_formatTime(int.parse('${(provider.seconds)}'))}',style: TextStyle(color: Colors.white)))
                                      : Center(child: Text('00:00:00',style: TextStyle(color: Colors.white))),
                                ),
                              ),
                            /*  Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      reminingTime >= 6 ?  provider.sendCenterHomeData(context) : null;
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      width: 200.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50.0),
                                        color: MyAppTheme.cardBgSecColor,
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          reminingTime >= 6 ?
                                          Container(
                                              width: 80.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50.0),
                                                color: Colors.green,
                                              ),
                                            child: Center(
                                              child: Text('Yes',style: TextStyle(color: Colors.white,fontSize: 16),),
                                            ),

                                          ): Padding(
                                            padding: const EdgeInsets.only(left: 20.0),
                                            child: Text(
                                              '${_formatTime(int.parse('${(provider.hours)-(provider.ghours)}'))}:${_formatTime(int.parse('${(provider.minutes)-(provider.gminutes)}'))}:${_formatTime(int.parse('${(provider.seconds)}'))}',
                                              style: TextStyle(color: Colors.white,),
                                            ),
                                          ),
                                          reminingTime >= 6 ? Padding(
                                            padding: const EdgeInsets.only(right: 20.0),
                                            child: Text(
                                              '0${provider.hours}:${_formatTime(provider.minutes)}:${_formatTime(provider.seconds)}',
                                              style: TextStyle(color: Colors.white,),
                                            ),
                                          ) :
                                          Container(
                                              width: 80.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50.0),
                                                color: Colors.red,
                                              ),
                                            child: Center(
                                            child: Text('No',style: TextStyle(color: Colors.white,fontSize: 16),),
                                  ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),*/
                           /*   RippleAnimation(
                                child: Center(
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          MyAppTheme.cardBgSecColor,
                                          MyAppTheme.cardBgSecColor,
                                        ], // Example gradient colors
                                      ),
                                      border: Border.all(color: Colors.orange, width: 5),
                                    ),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 100),
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.orange, width: 5),
                                      ),
                                      child: Center(
                                        child:  GestureDetector(
                                          onTap: () {
                                            if(display = true){
                                              callCountDownTimer();
                                              provider.sendCenterHomeData(context);
                                            }

                                          },
                                          child: Container(
                                            height: 30,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                              border: Border.all(color: Colors.white, width: 1),
                                            ),
                                            child: Center(
                                              child: Text(
                                                  display == false ? "Mining":'0$_hours:${_formatTime(_minutes)}:${_formatTime(_seconds)}',
                                                style: TextStyle(color: Colors.white,),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                color: MyAppTheme.cardBgSecColor,
                                delay: const Duration(milliseconds: 300),
                                repeat: true,
                                minRadius: 75,
                                ripplesCount: 6,
                                duration: const Duration(milliseconds: 6 * 300),
                              ),*/
                              Container(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: MyAppTheme.cardBgSecColor)),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    innerContainerComponent(
                                        img: MyImages.withdrawal,
                                        onTap: () {
                                          withdrawalBottomSheet(
                                              context, "${homeModel!.dashboard![0].workingCurrentBalance}");
                                        },
                                        title: withdrawal),
                                    innerContainerComponent(
                                        img: MyImages.deposit,
                                        title: deposit,
                                        onTap: () {
                                          depositBottomSheet(
                                              context, depositModel!);
                                        }),
                                    innerContainerComponent(
                                        img: MyImages.p2p,
                                        title: p2p,
                                        onTap: () {
                                          p2pBottomSheet(context, "${homeModel!.dashboard![0].workingCurrentBalance}");
                                        }),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: MyAppTheme.cardBgSecColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    blackLight12Text(
                                        "$remainingLimit : \$ ${homeModel!.dashboard![0].totremain}"),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6.0),
                                      child: LinearProgressIndicator(
                                          backgroundColor:
                                          MyAppTheme.greyColor,
                                          color: MyAppTheme.brownColor,
                                          semanticsValue:
                                          '${homeModel!.dashboard![0].isTotalEarned}',
                                          minHeight: 15,
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          value: homeModel!
                                              .dashboard![0].totremain),
                                    ),
                                    blackLight12Text(
                                        "Total earned \$ ${homeModel!.dashboard![0].isTotalEarned} of investment"),
                                  ],
                                ),
                              ),

                              mainBtn(
                                  text: tradeAll,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AccountActivation(amount: '${homeModel!.dashboard![0].activationEWalletBalance}',),
                                        )).then((value) => {
                                           //   locator<HomeProvider>().getHomeData(context)
                                    });
                                  }),
                              Row(
                                children: [
                                  Expanded(
                                      child: CommonContainer(
                                          height: height * 0.10,
                                          title: "Mining Income",
                                          value:
                                          "\$ ${homeModel!.dashboard![0].roi}")),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: CommonContainer(
                                          height: height * 0.10,
                                          title: "Booster Status",
                                          value:
                                          "\$ ${homeModel!.dashboard![0].isbooster}"))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: CommonContainer(
                                          height: height * 0.10,
                                          title: "Direct Income",
                                          value:
                                          "\$ ${homeModel!.dashboard![0].directincome}")),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: CommonContainer(
                                          height: height * 0.10,
                                          title: "Level Income",
                                          value:
                                          "\$ ${homeModel!.dashboard![0].levelincome}"))
                                ],
                              ),
                              InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  height: height * 0.10,
                                  width: width,
                                  decoration: BoxDecoration(
                                      color: MyAppTheme.cardBgSecColor,
                                      borderRadius: const BorderRadius.all(Radius.circular(8),)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      white14Text('Total Income'),
                                      white14Text("\$ ${homeModel!.dashboard![0].totalamount}")
                                    ],
                                  ),
                                ),
                              ),
                              mainBtn(
                                  text: componding,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CompoundInvest(amount: '${homeModel!.dashboard![0].activationEWalletBalance}',),
                                        )).then((value) => {
                                      //   locator<HomeProvider>().getHomeData(context)
                                    });
                                  }),
                              Row(
                                children: [
                                  Expanded(
                                      child: CommonContainer(
                                          height: height * 0.10,
                                          title: "Compounding Income",
                                          value:
                                          "\$ ${homeModel!.dashboard![0].isTrading}")),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: CommonContainer(
                                          height: height * 0.10,
                                          title: "Compounding Direct Income",
                                          value:
                                          "\$ ${homeModel!.dashboard![0].isFinance}"))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: CommonContainer(
                                          height: height * 0.10,
                                          title: "Compounding Level Income",
                                          value:
                                          "\$ ${homeModel!.dashboard![0].isRealEstate}"))
                                ],
                              ),
                              black16Text(wallet),
                              Row(
                                children: [
                                  Expanded(
                                      child: CommonContainer(
                                        height: height * 0.10,
                                        title: "Main Wallet",
                                        value:
                                        "\$ ${homeModel!.dashboard![0].workingCurrentBalance}",
                                        widget: CircleAvatar(
                                          foregroundImage:
                                          AssetImage(MyImages.mainWallet),
                                          radius: height * 0.03,
                                        ),
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: CommonContainer(
                                        height: height * 0.10,
                                        title: "Total Withdra",
                                        value:
                                        "\$ ${homeModel!.dashboard![0].totWithdrawal}",
                                        widget: CircleAvatar(
                                          foregroundImage:
                                          AssetImage(MyImages.totalWithdrawal),
                                          radius: height * 0.03,
                                        ),
                                      )),
                                ],
                              ),
                              black16Text(income),
                              Row(
                                children: [
                                  Expanded(
                                      child: CommonContainer(
                                        height: height * 0.10,
                                        title: "Active Direct",
                                        value:
                                        " ${homeModel!.dashboard![0].directCountActiveTeam}",
                                        widget: Icon(Icons.person, size: 35,color: Colors.white),
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: CommonContainer(
                                        height: height * 0.10,
                                        title: "Team Business",
                                        value:
                                        " ${homeModel!.dashboard![0].downlineActTeamCount}",
                                        widget: Icon(Icons.person, size: 35,color: Colors.white),
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: CommonContainer(
                                        height: height * 0.10,
                                        title: "Self Business",
                                        value:
                                        " ${homeModel!.dashboard![0].totalSelfBusiness}",
                                        widget: Icon(Icons.person, size: 35,color: Colors.white,),
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: CommonContainer(
                                        height: height * 0.10,
                                        title: "Total Team Busine",
                                        value:
                                        " ${homeModel!.dashboard![0].todayDownlineBusiness}",
                                        widget: Icon(Icons.person, size: 35,color: Colors.white),
                                      )),
                                ],
                              ),
                            ]
                                .map((e) => Padding(
                              padding:
                              EdgeInsets.symmetric(vertical: 4),
                              child: e,
                            ))
                                .toList(),
                          ),
                        ),
                      );
                    },
                  )
                      : SizedBox(),
                ),
              ],
            ),
          );
        },
      )
      ,
    );
  }
  String _formatTime(int time) {
    return time < 10 ? '0$time' : '$time';
  }
  innerContainerComponent({
    required String img,
    required String title,
    VoidCallback? onTap,
  }) {
    var height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0), // Adjust the padding value as needed
            child: CircleAvatar(
              foregroundImage: AssetImage(img),
              radius: height * 0.03,
            ),
          ),
          black12Text(title)
        ],
      ),
    );
  }
}
