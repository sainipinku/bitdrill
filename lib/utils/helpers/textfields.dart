

import 'package:flutter/material.dart';
import '../constants.dart';
import '../helper.dart';
import '../my_app_theme.dart';
import '../my_icons.dart';
import '../my_styles.dart';
import '../ui_helper.dart';



// Widget phoneTextField ( {required TextEditingController controller , String? svgIcon, EdgeInsets? scrollPadding}) {
//   return TextFormField(
//
//       //style: MyStyles.black18TextLight,
//       scrollPadding: (scrollPadding == null) ? EdgeInsets.zero : scrollPadding,
//       controller: controller,
//       keyboardType: TextInputType.number,
//       validator: (phone) {
//         if(phone!.isEmpty){
//           return 'Please enter a phone number';
//         }else{
//           return null;
//         }
//       },
//       decoration: InputDecoration(
//         prefixIcon:  Padding(
//           padding: EdgeInsets.all(8),
//           child: SvgPicture.asset(MyIcons.phoneIc,height: 20,width: 20,),
//         ) ,
//         // contentPadding: const EdgeInsets.all(12),
//         hintText: enterPhoneNumber,
//         enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: MyAppTheme.hintTextColor),
//             borderRadius: BorderRadius.all(
//                 Radius.circular(11))),
//         //hintStyle: ,
//         errorBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: MyAppTheme.errorColor),
//             borderRadius: BorderRadius.all(
//                 Radius.circular(11))
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: MyAppTheme.errorColor),
//             borderRadius:  BorderRadius.all(
//                 Radius.circular(11))
//         ),
//         focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: MyAppTheme.hintTextColor),
//             borderRadius: BorderRadius.circular(11)),
//       ));
// }

Widget emailTextField ( {required TextEditingController controller , String? svgIcon, EdgeInsets? scrollPadding}) {
  return TextFormField(
      style: MyStyles.white14lightStyle,
      scrollPadding: (scrollPadding == null) ? EdgeInsets.zero : scrollPadding,
      controller: controller,
      validator: (email) {
        if(email!.isEmpty){
          return 'Please enter an email';
        }
        else if(Helpers.isEmail(email)){
          return null;
        }else{
          return 'Please enter a valid email';
        }
      },
      decoration: InputDecoration(
        prefixIcon: (svgIcon != null)
            ? svgImage(img: svgIcon) : null,
        // contentPadding: const EdgeInsets.all(12),
        hintText: enterEmailText,
        hintStyle: MyStyles.hintTextStyle,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.whiteColor),
            borderRadius: BorderRadius.all(
                Radius.circular(10))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.whiteColor),
            borderRadius: BorderRadius.all(
                Radius.circular(10))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.errorColor),
            borderRadius: BorderRadius.all(
                Radius.circular(10))
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.errorColor),
            borderRadius:  BorderRadius.all(
                Radius.circular(10))
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.whiteColor),
            borderRadius: BorderRadius.circular(10)),

      ));
}

Widget passwordTextField ( {required TextEditingController controller ,
  String? hintText ,
  VoidCallback? onEyeTap,
  bool isObscureBtnVisible =true,
  String? svgIcon,
  EdgeInsets? scrollPadding,
  bool isObscureText = false}) {
  return TextFormField(
      //style: MyStyles.black18TextLight,
      //scrollPadding: (scrollPadding == null) ? EdgeInsets.zero : scrollPadding,
      controller: controller,
      validator: (value) {
        if(value!.isEmpty){
          return 'Please fill password';
        }else if(value.length < 6){
          return "Password must contain six Characters";
        }else{
          return null;
        }
      },
      obscureText: isObscureText,
      obscuringCharacter: '*',
      style: MyStyles.white14lightStyle,
      decoration: InputDecoration(
        suffixIcon:(isObscureBtnVisible)? GestureDetector(
          onTap: onEyeTap,
          child: (isObscureText)?
          svgImage(img: MyIcons.eye,color: MyAppTheme.whiteColor):
              svgImage(img: MyIcons.eyeOff,height: 24,width: 24,color: MyAppTheme.whiteColor),
        ):null,
        // contentPadding: const EdgeInsets.all(12),
        hintText: hintText ?? '*************',


        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.whiteColor),
            borderRadius: BorderRadius.all(
                Radius.circular(10))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.whiteColor),
            borderRadius: BorderRadius.all(
                Radius.circular(10))),
        hintStyle: MyStyles.hintTextStyle,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.errorColor),
            borderRadius: BorderRadius.all(
                Radius.circular(10))
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.errorColor),
            borderRadius:  BorderRadius.all(
                Radius.circular(10))
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.whiteColor),
            borderRadius: BorderRadius.circular(10)),
      ));
}


Widget customTextField ( {
  required TextEditingController controller ,
  String? svgIcon,
  EdgeInsets? scrollPadding,
  String? hintText,
  VoidCallback? onIconTap,
  TextInputType? textInputType,
  bool? disabled}) {
  return TextFormField(
    //enabled: (disabled== null)? true : !disabled,
      style: MyStyles.white14lightStyle,
      textCapitalization: TextCapitalization.words,
      scrollPadding: (scrollPadding == null) ? EdgeInsets.zero : scrollPadding,
      controller: controller,
      keyboardType: textInputType?? TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: (svgIcon != null)
            ? GestureDetector(
          onTap: onIconTap,
          child: svgImage(img: svgIcon)
        ) : null,
        //contentPadding: const EdgeInsets.all(12),
        hintText: (hintText!=null)? hintText : '',
        hintStyle: MyStyles.hintTextStyle,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.whiteColor),
            borderRadius: BorderRadius.all(
                Radius.circular(10))),

        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.whiteColor),
            borderRadius: BorderRadius.all(
                Radius.circular(10))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.errorColor),
            borderRadius: BorderRadius.all(
                Radius.circular(10))
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.errorColor),
            borderRadius:  BorderRadius.all(
                Radius.circular(10))
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.whiteColor),
            borderRadius: BorderRadius.circular(10)),
      ));
}
