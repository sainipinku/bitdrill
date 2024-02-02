import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'my_app_theme.dart';
import 'my_icons.dart';
import 'my_images.dart';
import 'my_styles.dart';

Widget svgImage({required String img, double? height, double? width, Color? color,double? scaleFactor}) {
  return Transform.scale(
    scale: scaleFactor??1,
    child: SvgPicture.asset(
      img,
      height: height ?? 24,
      width: width ?? 24,
      fit: BoxFit.scaleDown,
      color: color,
    ),
  );
}

Widget svgMenuImage({double? height, double? width, Color? color}) {
  return Transform.scale(
    scale: 1.4,
    child: SvgPicture.asset(
      MyIcons.menuIc,
      height: height ?? 24,
      width: width ?? 24,
      fit: BoxFit.scaleDown,
      color: color,
    ),
  );
}

Widget logoutDialog(BuildContext context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(31)
    ),
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
              colors: [MyAppTheme.gradient1purple, MyAppTheme.gradient2lightPurple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          white18boldText(areYouSureYouToLogout),
          white12LightText(logoutText),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: MyAppTheme.redBtnColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: white16BoldText('No'),
                ),
              ),
              GestureDetector(
                onTap: () async {
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border:Border.all(
                        color: MyAppTheme.gradient1btn,
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: white16BoldText('Yes'),
                ),
              ),
            ],
          )
        ].map((e) => Padding(padding: EdgeInsets.symmetric(vertical: 3),child: e,)).toList(),
      ),
    ),
  );
}

Widget customElevatedBtnWithWidget(
    {required Widget child,
    required VoidCallback onTap,
    double? height,
    Color? bgColor,
    Color? borderColor,
    double? width,}) {
  return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
          backgroundColor: bgColor ?? Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
            side: BorderSide(
              color: borderColor ?? Colors.transparent
            )
          ),
          fixedSize: Size((width != null) ? width : double.infinity,
              (height != null) ? height : 50)),
      child: child);
}
//
// void hideKeyboard(BuildContext context) {
//   FocusScopeNode currentFocus = FocusScope.of(context);
//   if (!currentFocusasPrimaryFocus) {
//     currentFocus.unfocus();
//   }
// }

backgroundGradient() {
  return BoxDecoration(
      gradient: LinearGradient(
          colors: [MyAppTheme.gradient1purple, MyAppTheme.gradient2lightPurple],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter));
}

btnGradient({BorderRadius? borderRadius}) {
  return BoxDecoration(
      borderRadius: borderRadius ?? BorderRadius.circular(10),
      gradient: LinearGradient(
          colors: [MyAppTheme.gradient1btn, MyAppTheme.gradient2lightBtn],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight));
}

backBtn({
  required BuildContext context,
  VoidCallback? onTap
}) {
  return GestureDetector(
      onTap: onTap ??() {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: MyAppTheme.containerFillingColor,
          borderRadius: BorderRadius.circular(10)
        ),
          padding: EdgeInsets.all(8),
          child: svgImage(
              img: MyIcons.backArrowIc,
          )));
}

settingTile({VoidCallback? onTap, required String title, Widget? secondWidget}) {
  return GestureDetector(
    onTap: onTap ?? () {},
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: MyAppTheme.whiteColor, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          white14BoldText(title),
          secondWidget ?? svgImage(img: MyIcons.getIntoIc),
        ],
      ),
    ),
  );
}

circularImage(String imgUrl,{double? height,double? width,}) {
  return Container(
    height: height ?? 72,
    width: width ?? 72,
    decoration: const BoxDecoration(shape: BoxShape.circle),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: Image.asset(
          imgUrl,
          fit: BoxFit.fill,
        )),
  );
}


circularNetworkImage(String imgUrl) {
  return Container(
    height: 72,
    width: 72,
    decoration: const BoxDecoration(shape: BoxShape.circle),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: FadeInImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
          width: double.infinity,
          height: 270,
          placeholder: AssetImage(MyImages.chap1Img),
          imageErrorBuilder: (context,
              error, stackTrace) {
            //debugPrint("image url ${storyDetailModel.data!.storyChapter[selectedPageIndex].imageUrl}");
            return Image.asset(
              MyImages.chap1Img,
              fit: BoxFit.cover,
            );
          },
        ),),
  );
}

mainBtn({
  required String text,
  required VoidCallback onTap,
  double? height,
  double? width,
  Widget? icon,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      //height: height ?? 56,
      padding: EdgeInsets.symmetric(vertical: (1 >700)?10:18),
      width: width ?? double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration : BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MyAppTheme.blackLightColor
      ),
      child: (icon != null) ?
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            white16BoldText(text),
            SizedBox(width: 5,),
            icon,
          ],)
          :white16BoldText(text),
    ),
  );
}

circularBtn({
  required String icon, required VoidCallback onTap, double? height, double? width, double? scaleFactor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height ?? 56,
      width: width ?? 56,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: btnGradient(
        borderRadius: BorderRadius.circular((width != null) ? width / 2 : 28),
      ),
      child: svgImage(
        img: icon,
        scaleFactor: scaleFactor
      ),
    ),
  );
}

storyContainer({
  required String img,
  required String storyTitle,
  required String dateOfStory,
  VoidCallback? onTap
}) {
  return Container(
    width: double.infinity,
    //height: 112,
    margin: EdgeInsets.symmetric(vertical: 10),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyAppTheme.containerFillingColor,
        border: Border.all(color: MyAppTheme.gradient1btn)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //circularImage(img),
        circularNetworkImage(img),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                white16BoldText(storyTitle),
                SizedBox(
                  height: 4,
                ),
                white12LightText(dateOfStory)
              ],
            ),
          ),
        ),
        circularBtn(icon: MyIcons.playIc, onTap: onTap ?? () {})
      ],
    ),
  );
}

drawerTile({VoidCallback? onTap,required String icon,required String title}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      color: Colors.transparent,
      width: double.infinity,
      padding:  EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          svgImage(img: icon),
          SizedBox(width: 10,),
          normalText(title)
        ],
      ),
    ),
  );
}

subscriptionContainer({
  required String subscriptionTitle,
  required String subscriptionPrice,
  required String subscriptionValidity,
  required String perDayStoryCount,
  required String childLimit,
  required String storyExpiry,
  required bool subsStatus,
  required VoidCallback onTap,
}) {
  return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: MyAppTheme.gradient2lightPurple),
          borderRadius: BorderRadius.circular(10),
          color: MyAppTheme.containerFillingColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              white16BoldText(subscriptionTitle),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  white16BoldText('\$$subscriptionPrice/'),
                  white12LightText(subscriptionValidity),
                ],
              ),
            ],
          ),
          Divider(
            color: MyAppTheme.whiteColor,
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: MyAppTheme.whiteColor,
                size: 6,
              ),
              SizedBox(
                width: 5,
              ),
              RichText(
                text: TextSpan(
                    text: "$perDayStoryCount Story ",
                    style: MyStyles.white12BoldStyle,
                    children: [
                      TextSpan(
                          text: 'per Day',
                          style: MyStyles.white12LightStyle),
                    ]),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: MyAppTheme.whiteColor,
                size: 6,
              ),
              SizedBox(
                width: 5,
              ),
              RichText(
                text: TextSpan(
                    text: "$childLimit Child ",
                    style: MyStyles.white12BoldStyle,
                    children: [
                      TextSpan(
                          text: 'profile creation',
                          style: MyStyles.white12LightStyle),
                    ]),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: MyAppTheme.whiteColor,
                size: 6,
              ),
              SizedBox(
                width: 5,
              ),
              RichText(
                text: TextSpan(
                    text: "Access to past ",
                    style: MyStyles.white12LightStyle,
                    children: [
                      TextSpan(
                          text: '$storyExpiry days stories', style: MyStyles.white12BoldStyle),
                    ]),
              ),
            ],
          ),
          Divider(
            color: MyAppTheme.whiteColor,
          ),
          InkWell(
            onTap: onTap,
            child: Center(
              child: Text(
                (subsStatus)? "Subscribed": "Subscribe",
                style: MyStyles.underLineSubHeading,
              ),
            ),
          ),
        ]
            .map((e) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: e,
                ))
            .toList(),
      ));
}

/////////////////Flutter Toast////////////////////////////

msgToast({required String msg}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: MyAppTheme.gradient1btn,
      textColor: Colors.white,
      fontSize: 12.0);
}

//////////////////Text helpers////////////////////////////

Text headingText(String text,{TextAlign? textAlign,bool isOverFlow = false }) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    style: MyStyles.white22boldStyle,
    maxLines: (isOverFlow) ?1 : null,
    overflow: (isOverFlow) ? TextOverflow.ellipsis : null,
  );
}

Text white20boldText(String text,{TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    style: MyStyles.white20boldStyle,
  );
}

Text white18boldText(String text,{TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    style: MyStyles.white18boldStyle,
  );
}

Text white16regularText(String text) {
  return Text(
    text,
    style: MyStyles.white16RegularStyle,
  );
}

Text white16BoldText(String text) {
  return Text(
    text,
    style: MyStyles.white16BoldStyle,
  );
}

Text white16ExtraBoldText(String text) {
  return Text(
    text,
    style: MyStyles.white16RegularStyle,
  );
}

Text normalText(String text,{TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    style: MyStyles.white14lightStyle,
  );
}

Text white14BoldText(String text,{TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    style: MyStyles.white14boldStyle,
  );
}

Text white12LightText(String text,{TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    style: MyStyles.white12LightStyle,
  );
}

Text white12DarkText(String text) {
  return Text(
    text,
    style: MyStyles.white12BoldStyle,
  );
}




Text termsTextDark12Text(String text) {
  return Text(
    text,
    style: MyStyles.termsTextDark12Style,
  );
}
Text termsTextLight12Text(String text) {
  return Text(
    text,
    style: MyStyles.termsText12Style,
  );
}
Text termsText14Text(String text) {
  return Text(
    text,
    style: MyStyles.termsText14Style,
  );
}




///////////////// Dark Black //////////////////////////
Text black14DarkText(String text) {
  return Text(
    text,
    style: MyStyles.black14BoldStyle,
  );
}


///////////////// Black //////////////////////////

Text black16Text(String text) {
  return Text(
    text,
    style: MyStyles.black16BoldStyle,
  );
}

Text black14Text(String text) {
  return Text(
    text,
    style: MyStyles.black14BoldStyle,
  );
}


///// black light


Text blackLight12Text(String text) {
  return Text(
    text,
    style: MyStyles.lightBlack12RegularStyle,
  );
}
