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

// void hideKeyboard(BuildContext context) {
//   FocusScopeNode currentFocus = FocusScope.of(context);
//   if (!currentFocusasPrimaryFocus) {
//     currentFocus.unfocus();
//   }
// }

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
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10)
        ),
          padding: const EdgeInsets.all(8),
          child: Icon(Icons.arrow_back,color: MyAppTheme.whiteColor,)));
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

customAppBar({
  required String title,
  Widget? backBtn,
}){
  return AppBar(
    title: white16BoldText(title),
    centerTitle: true,
    leading: backBtn ?? const SizedBox.shrink(),
    backgroundColor: MyAppTheme.logoColor,
  );
}

mainBtn({
  required String text,
  required VoidCallback onTap,
  double? height,
  double? width,
  Widget? icon,
  bool focus =true,
  double? borderRadius
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      //height: height ?? 56,
      padding: const EdgeInsets.symmetric(vertical: (1 >700)?10:18),
      width: width ?? double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration : BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        color: focus ?MyAppTheme.logoColor :Colors.transparent,
          border: Border.all(color: MyAppTheme.logoColor)
      ),
      child: (icon != null) ?
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            focus ? white16BoldText(text) : black16Text(text),
            const SizedBox(width: 5,),
            icon,
          ],)
          :focus ? white16BoldText(text) : black16Text(text),
    ),
  );
}

miniBrownContainer({required String text}){
  return Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: MyAppTheme.brownColor,
      borderRadius: BorderRadius.circular(5),
    ),
    child: white14BoldText( text,),
  );
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


///////////////// Dark Black //////////////////////////
Text black14DarkText(String text) {
  return Text(
    text,
    style: MyStyles.black14BoldStyle,
  );
}


///////////////// Black //////////////////////////

Text black26Text(String text) {
  return Text(
    text,
    style: MyStyles.black26BoldStyle,
  );
}
Text black20Text(String text) {
  return Text(
    text,
    style: MyStyles.black20BoldStyle,
  );
}
Text black16Text(String text) {
  return Text(
    text,
    style: MyStyles.black16BoldStyle,
  );
}
Text black30Text(String text) {
  return Text(
    text,
    style: MyStyles.black30BoldStyle,
  );
}


Text black14Text(String text) {
  return Text(
    text,
    style: MyStyles.black14BoldStyle,
  );
}

Text white14Text(String text) {
  return Text(
    text,
    style: MyStyles.white14boldStyle,
  );
}

Text black12Text(String text) {
  return Text(
    text,
    style: MyStyles.white12LightStyle,
  );
}




///// black light


Text blackLight14Text(String text) {
  return Text(
    text,
    style: MyStyles.white14lightStyle,
  );
}
Text blackLight12Text(String text) {
  return Text(
    text,
    style: MyStyles.white12LightStyle,
  );
}


/////////brown

Text brownLight14Text(String text) {
  return Text(
    text,
    style: MyStyles.brownBlack14RegularStyle,
  );
}
Text brown14Text(String text) {
  return Text(
    text,
    style: MyStyles.brownBlack14BoldStyle,
  );
}