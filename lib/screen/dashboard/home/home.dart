import 'dart:async';

import 'package:bitdrill/common_ui/common_container.dart';
import 'package:bitdrill/screen/dashboard/home/p2p_btm_sheet.dart';
import 'package:bitdrill/screen/dashboard/home/trade_ai.dart';
import 'package:bitdrill/screen/dashboard/home/withdrawal_bottom_sheet.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/my_images.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List banner = ['assets/images/slider01.jpg','assets/images/slider02.jpg','assets/images/slider03.jpg',];
  late PageController _controller = PageController(
      viewportFraction: banner.length == 1 ? 1 : 0.80, initialPage: 0);
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
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
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                                  height: height* 0.22,
                                  width: width,
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(5.0),
                                    child: Center(
                                        child: FadeInImage(
                                          image: NetworkImage(banner[index]),
                                          fit: BoxFit.fill,
                                          width: width,
                                          height: height * 0.25,
                                          placeholder: const AssetImage(
                                              "assets/images/tennis_ball_banner_placeholder.png"),
                                          imageErrorBuilder:
                                              (context, error,
                                              stackTrace) {
                                            return Image.asset(
                                              "assets/images/tennis_ball_banner_placeholder.png",
                                            );
                                          },
                                        )),
                                  )),
                            );

                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 20.0),
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
                    Expanded(child: CommonContainer(height: height* 0.10, title: "title", value: "value")),
                    const SizedBox(width: 10,),
                    Expanded(child: CommonContainer(height: height* 0.10, title: "title", value: "value"))
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
                          onTap: (){
                            showModalBottomSheet(context: context, builder: (context) => withdrawalBottomSheet(context: context, amount: "0.11"),);
                          },
                          title: withdrawal),
                      innerContainerComponent(img: MyImages.thisProject,
                          title: deposit),
                      innerContainerComponent(img: MyImages.thisProject,
                          title: p2p,
                          onTap: (){
                            showModalBottomSheet(context: context, builder: (context) =>p2pBottomSheet(context: context, amount: "0.11"),);
                          }
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
                      blackLight12Text("$remainingLimit : 3456"),

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

                      blackLight12Text("Total earned 44.9% of investment"),
                    ],
                  ),
                ),

                mainBtn(text: tradeAll, onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AccountActivation(),));
                }),
                Row(
                  children: [
                    Expanded(child: CommonContainer(height: height* 0.10, title: "title", value: "value")),
                    const SizedBox(width: 10,),
                    Expanded(child: CommonContainer(height: height* 0.10, title: "title", value: "value"))
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CommonContainer(height: height* 0.10, title: "title", value: "value")),
                    const SizedBox(width: 10,),
                    Expanded(child: CommonContainer(height: height* 0.10, title: "title", value: "value"))
                  ],
                ),

                black16Text(wallet),
                Row(
                  children: [
                    Expanded(child: CommonContainer(
                        height: height* 0.10,
                        title: "title",
                        value: "value",
                      widget: CircleAvatar(
                        foregroundImage: AssetImage(MyImages.thisProject),
                        radius: height*0.03,
                      ),
                    )),
                    const SizedBox(width: 10,),
                    Expanded(child: CommonContainer(
                      height: height* 0.10,
                      title: "title",
                      value: "value",
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
                        title: "title",
                        value: "value",
                      widget: Icon(Icons.person,size: 35),
                    )),
                    const SizedBox(width: 10,),
                    Expanded(child: CommonContainer(
                      height: height* 0.10,
                      title: "title",
                      value: "value",
                      widget: Icon(Icons.person,size: 35),
                    )),
                  ],
                ),
              ].map((e) => Padding(padding: EdgeInsets.symmetric(vertical: 4),child: e,)).toList(),
            ),
          ),
        ),
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
