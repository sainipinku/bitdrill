import 'dart:async';

import 'package:bitdrill/common_ui/common_container.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Stack(
                  children: [
                    SizedBox(
                      width:
                      MediaQuery.of(context).size.width,
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
                                height: MediaQuery.of(context)
                                    .size
                                    .height *
                                    0.22,
                                width: MediaQuery.of(context)
                                    .size
                                    .width,
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(
                                      5.0),
                                  child: Center(
                                      child: FadeInImage(
                                        image: NetworkImage(
                                            banner[index]),
                                        fit: BoxFit.fill,
                                        width:
                                        MediaQuery.of(context)
                                            .size
                                            .width,
                                        height:
                                        MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.25,
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
                            effect:  ExpandingDotsEffect(
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
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommonContainer(height: height* 0.10, color: Colors.black45, title: "title", value: "value"),
                  )),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommonContainer(height: height* 0.10, color: Colors.black45, title: "title", value: "value"),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
