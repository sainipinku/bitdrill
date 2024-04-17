

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';
import '../helper.dart';
import '../my_app_theme.dart';
import '../my_icons.dart';
import '../my_styles.dart';
import '../ui_helper.dart';



Widget phoneTextField ( {
  required TextEditingController controller ,
  String? svgIcon,
  Icon? prefixIcon,
  EdgeInsets? scrollPadding}) {
  return TextFormField(

      //style: MyStyles.black18TextLight,
      scrollPadding: (scrollPadding == null) ? EdgeInsets.zero : scrollPadding,
      controller: controller,
      keyboardType: TextInputType.number,
      validator: (phone) {
        if(phone!.isEmpty){
          return 'Please enter a phone number';
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
        prefixIcon: (svgIcon != null) ? svgImage(img: svgIcon) : null,
        // contentPadding: const EdgeInsets.all(12),
        hintText: enterPhoneText,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.hintTextColor),
            borderRadius: BorderRadius.all(
                Radius.circular(11))),
        //hintStyle: ,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.errorColor),
            borderRadius: BorderRadius.all(
                Radius.circular(11))
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.errorColor),
            borderRadius:  BorderRadius.all(
                Radius.circular(11))
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.hintTextColor),
            borderRadius: BorderRadius.circular(11)),
      ));
}

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
        prefixIcon: (svgIcon != null) ? svgImage(img: svgIcon) : null,
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
class PasswordField extends StatefulWidget {
  const PasswordField({
    required this.fieldKey,
    required this.prefixIcon,
    required this.hintText,
    required this.labelText,
    required this.helperText,
    required this.onSaved,
    required this.validator,
    required this.onFieldSubmitted,

  });

  final Key fieldKey;
  final Icon? prefixIcon;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => new _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration:  InputDecoration(
        prefixIcon: widget.prefixIcon,
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.blackLightColor),
            borderRadius: const BorderRadius.all(
                Radius.circular(5))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.blackLightColor),
            borderRadius: const BorderRadius.all(
                Radius.circular(5))),
        hintStyle: MyStyles.lightBlack14RegularStyle,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.errorColor),
            borderRadius: const BorderRadius.all(
                Radius.circular(5))
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.blackLightColor),
            borderRadius:  const BorderRadius.all(
                Radius.circular(5))
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.blackLightColor),
            borderRadius: BorderRadius.circular(5)),
        suffixIcon:  GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child:
           Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
Widget passwordTextField ( {required TextEditingController controller ,
  String? hintText ,
  VoidCallback? onEyeTap,
  bool isObscureBtnVisible =true,
  String? svgIcon,
  Icon? prefixIcon,
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
      style: MyStyles.black14BoldStyle,
      decoration: InputDecoration(
        suffixIcon:(isObscureBtnVisible)? GestureDetector(
          onTap: onEyeTap,
          child:  Icon(isObscureText ? Icons.visibility : Icons.visibility_off,color: Colors.white,),
        ):null,
        // contentPadding: const EdgeInsets.all(12),
        prefixIcon: prefixIcon,
        hintText: hintText ?? '*************',
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius: const BorderRadius.all(
                Radius.circular(5))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius: const BorderRadius.all(
                Radius.circular(5))),
        hintStyle: MyStyles.lightBlack14RegularStyle,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius: const BorderRadius.all(
                Radius.circular(5))
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius:  const BorderRadius.all(
                Radius.circular(5))
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius: BorderRadius.circular(5)),
      )
  );
}

/*
Widget customTextField ( {
  required TextEditingController controller ,
  String? svgIcon,
  Icon? suffixIcon,
  Icon? prefixIcon,
  EdgeInsets? scrollPadding,
  String? hintText,
  VoidCallback? onIconTapSuffix,
  VoidCallback? onIconTapPrefix,
  TextInputType? textInputType,
  bool? disabled}) {
  return TextFormField(
    //enabled: (disabled== null)? true : !disabled,
      style: MyStyles.lightBlack14BoldStyle,
      textCapitalization: TextCapitalization.words,
      scrollPadding: (scrollPadding == null) ? EdgeInsets.zero : scrollPadding,
      controller: controller,
      keyboardType: textInputType?? TextInputType.text,

      decoration: InputDecoration(
        suffix: (suffixIcon != null) ? suffixIcon : (svgIcon != null)
            ? GestureDetector(
            onTap: onIconTapSuffix,
            child: svgImage(img: svgIcon)
        ) : null,
        prefix: (prefixIcon != null)?prefixIcon:(svgIcon != null)
            ? GestureDetector(
          onTap: onIconTapPrefix,
          child: svgImage(img: svgIcon)
        ) : null,
        //contentPadding: const EdgeInsets.all(12),
        hintText: (hintText!=null)? hintText : '',
        hintStyle: MyStyles.hintTextStyle,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.blackTextColor),
            borderRadius: BorderRadius.all(
                Radius.circular(5))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.blackTextColor),
            borderRadius: BorderRadius.all(
                Radius.circular(5))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.blackTextColor),
            borderRadius: BorderRadius.all(
                Radius.circular(5))
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.errorColor),
            borderRadius:  BorderRadius.all(
                Radius.circular(5))
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.blackTextColor),
            borderRadius: BorderRadius.circular(5)),
      ));
}*/
Widget phoneNumberTextfield({required TextEditingController controller,EdgeInsets? scrollPadding}){
  return TextFormField(
      cursorColor: MyAppTheme.whiteColor,
      style: MyStyles.white16BoldStyle,
      scrollPadding: (scrollPadding == null) ? EdgeInsets.zero : scrollPadding,
      controller: controller,
      enableInteractiveSelection: false,
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
      ],
      keyboardType: TextInputType.number,
      validator: (phone) {
        if(phone!.length == 10){
          return null;
        }else{
          return 'Enter a valid Phone Number';
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        //counter: const Offstage(),
        prefixIcon:  Icon(
          Icons.call,
          color: MyAppTheme.whiteColor,
          size: 22,
        ),
        hintText: '+91-XXXXX-XXXXX',
        fillColor:  MyAppTheme.cardBgSecColor,

        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius:
            BorderRadius.circular(10)
        ),

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius:
            BorderRadius.circular(10)),

        hintStyle: MyStyles.white14lightStyle,
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius:
            BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius:
            BorderRadius.circular(10)),
      ));
}
Widget customTextField({
  required TextEditingController controller ,
  Icon? suffixIcon,
  Icon? prefixIcon,
  String? hintText,
  TextInputType? textInputType,
}){
  return TextFormField(
    //enabled: (disabled== null)? true : !disabled,
      style: MyStyles.lightBlack14BoldStyle,
      textCapitalization: TextCapitalization.words,
      controller: controller,
      keyboardType: textInputType ?? TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        //contentPadding: const EdgeInsets.all(12),
        hintText : hintText ?? '',
        hintStyle: MyStyles.lightBlack14RegularStyle,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius: const BorderRadius.all(
                Radius.circular(5))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius: const BorderRadius.all(
                Radius.circular(5))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius: const BorderRadius.all(
                Radius.circular(5))
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius:  const BorderRadius.all(
                Radius.circular(5))
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius: BorderRadius.circular(5)),
      ));
}



Widget whiteTextField({
  required TextEditingController controller ,
  Icon? suffixIcon,
  Icon? prefixIcon,
  Widget? prefix,
  Widget? suffix,
  String? hintText,
  TextInputType? textInputType,
}){
  return Container(
    child: TextFormField(
      //enabled: (disabled== null)? true : !disabled,
        style: MyStyles.lightBlack14BoldStyle,
        textCapitalization: TextCapitalization.words,
        controller: controller,
        keyboardType: textInputType ?? TextInputType.text,

        decoration: InputDecoration(

          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefix: prefix,
          suffix: suffix,
          //contentPadding: const EdgeInsets.all(12),
          hintText : hintText ?? '',
          hintStyle: MyStyles.lightBlack14RegularStyle,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: MyAppTheme.cardBgSecColor),
              borderRadius: const BorderRadius.all(
                  Radius.circular(5))),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: MyAppTheme.cardBgSecColor),
              borderRadius: const BorderRadius.all(
                  Radius.circular(5))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: MyAppTheme.errorColor),
              borderRadius: const BorderRadius.all(
                  Radius.circular(5))
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: MyAppTheme.cardBgSecColor),
              borderRadius:  const BorderRadius.all(
                  Radius.circular(5))
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: MyAppTheme.cardBgSecColor),
              borderRadius: BorderRadius.circular(5)),
        )),
  );
}


Widget underLineTextField({
  required TextEditingController controller ,
  Icon? suffixIcon,
  Icon? prefixIcon,
  String? hintText,
  TextInputType? textInputType,
}){
  return TextFormField(
    //enabled: (disabled== null)? true : !disabled,
      style: MyStyles.lightBlack14BoldStyle,
      textCapitalization: TextCapitalization.words,
      controller: controller,
      keyboardType: textInputType ?? TextInputType.text,

      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        //contentPadding: const EdgeInsets.all(12),
        hintText : hintText ?? '',
        hintStyle: MyStyles.lightBlack14RegularStyle,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.blackTextColor),),
        disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.blackTextColor),),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.blackTextColor),
        ),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.errorColor),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.blackTextColor),)
      ));
}


