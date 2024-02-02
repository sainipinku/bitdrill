
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_app_theme.dart';

class MyFontWeight {
  static FontWeight light = FontWeight.w400;
  static FontWeight regular = FontWeight.w500;
  static FontWeight medium = FontWeight.w600;
  static FontWeight semiBold = FontWeight.bold;
  static FontWeight bold = FontWeight.w800;
  static FontWeight extraBold = FontWeight.w900;
}

class MyStyles {

  static TextStyle underLineSubHeading = GoogleFonts.quicksand(
      fontSize: (1 >= 700)? 8:14,
      color: MyAppTheme.whiteColor,
      fontWeight: MyFontWeight.regular,
      decoration: TextDecoration.underline,
      decorationColor: MyAppTheme.whiteColor);


  static TextStyle underLine18Style = GoogleFonts.quicksand(
      fontSize: (1 >= 700)? 10:18,
      color: MyAppTheme.whiteColor,
      fontWeight: MyFontWeight.bold,
      decoration: TextDecoration.underline,
      decorationColor: MyAppTheme.whiteColor);

/// ///////////////White Color /////////////////////

  ///////////////////UnderLine//////////////////////
  /*static TextStyle white16BoldStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.bold,
      fontSize: 16,
      color: MyAppTheme.whiteColor);*/
  ///////////////bold////////////////
  static TextStyle white24boldStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.semiBold,
      fontSize: (1 >= 700)? 18:24,
      color: MyAppTheme.whiteColor);

  static TextStyle white22boldStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.semiBold,
      fontSize: (1 >= 700)? 16:22,
      color: MyAppTheme.whiteColor);

  static TextStyle white20boldStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.semiBold,
      fontSize: (1 >= 700)? 14:20,
      color: MyAppTheme.whiteColor);

  static TextStyle white18boldStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.semiBold,
      fontSize: (1 >= 700)? 12:18,
      color: MyAppTheme.whiteColor);

  static TextStyle white16BoldStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.bold,
      fontSize: (1 >= 700)? 10:16,
      color: MyAppTheme.whiteColor);

  static TextStyle white14boldStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.semiBold,
      fontSize: (1 >= 700)? 8:14,
      color: MyAppTheme.whiteColor);

  static TextStyle white12BoldStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.bold,
      fontSize: (1 >= 700)? 6:12,
      color: MyAppTheme.whiteColor);

  ///underline
  static TextStyle white14BoldUnderlineStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.bold,
      fontSize: (1 >= 700)? 8:14,
      decoration: TextDecoration.underline,
      color: MyAppTheme.whiteColor);

  static TextStyle white16BoldUnderlineStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.bold,
      fontSize: (1 >= 700)? 10:16,
      decoration: TextDecoration.underline,
      color: MyAppTheme.whiteColor);



  ////////////////////regular/////////////////////
  static TextStyle white16RegularStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.regular,
      fontSize: (1 >= 700)? 10:16,
      color: MyAppTheme.whiteColor);



  ////////////////////light////////////////////////
  static TextStyle white16lightStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.light,
      fontSize: (1 >= 700)? 10:16,
      color: MyAppTheme.whiteColor);

  static TextStyle white14lightStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.light,
      fontSize: (1 >= 700)? 8:14,
      color: MyAppTheme.whiteColor);


  static TextStyle hintTextStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.light,
      fontSize: (1 >= 700)? 8:14,
      color: MyAppTheme.hintTextColor);

  static TextStyle white12LightStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.light,
      fontSize: (1 >= 700)? 6:12,
      color: MyAppTheme.whiteColor);

///////////////////Personalized////////////////////
//   static TextStyle storyContentStyle =  TextStyle(
//       fontWeight: MyFontWeight.light,
//       fontSize: 14,
//       letterSpacing: 1.5,
//       color: MyAppTheme.whiteColor);


  static TextStyle storyContentStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.light,
      fontSize: (1 >= 700)? 8:14,
      letterSpacing: 1.2,
      color: MyAppTheme.whiteColor);

  static TextStyle termsText12Style =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.regular,
      fontSize: (1 >= 700)? 6:12,
      letterSpacing: 1.2,
      color: MyAppTheme.lightPurpleTextColor);

  static TextStyle termsTextDark12Style =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.regular,
      fontSize: (1 >= 700)? 6:12,
      letterSpacing: 1.2,
      color: MyAppTheme.darkPurpleTextColor);

  static TextStyle termsTextDark24Style =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.bold,
      fontSize: (1 >= 700)? 18:24,
      letterSpacing: 1.2,
      color: MyAppTheme.darkPurpleTextColor);

  static TextStyle termsText14Style =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.regular,
      fontSize: (1 >= 700)? 8:14,
      letterSpacing: 1.2,
      color: MyAppTheme.lightPurpleTextColor);

  static TextStyle green12boldStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.bold,
      fontSize: (1 >= 700)? 6:12,
      color: MyAppTheme.greenColor);

  static TextStyle red14RegularStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.bold,
      fontSize: (1 >= 700)? 8:14,
      color: MyAppTheme.redBtnColor);


  ////////////////////Light Black /////////////////////

  ///////Bold
  static TextStyle lightBlack14BoldStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.bold,
      fontSize: 14,
      color: MyAppTheme.blackTextColor);

  ///////Regular
  static TextStyle lightBlack12RegularStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.regular,
      fontSize: 12,
      color: MyAppTheme.blackTextColor);

  static TextStyle lightBlack14RegularStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.regular,
      fontSize: 14,
      color: MyAppTheme.blackTextColor);
  ///////////////////////////Black////////////////////

  static TextStyle black16BoldStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.bold,
      fontSize: 16,
      color: MyAppTheme.blackColor);
  static TextStyle black14BoldStyle =  GoogleFonts.quicksand(
      fontWeight: MyFontWeight.bold,
      fontSize: 14,
      color: MyAppTheme.blackColor);




}
