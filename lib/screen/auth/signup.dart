import 'dart:convert';

import 'package:bitdrill/config/progressbar.dart';
import 'package:bitdrill/locator.dart';
import 'package:bitdrill/model/country_model.dart';
import 'package:bitdrill/providers/auth_provider.dart';
import 'package:bitdrill/repository/auth_repository.dart';
import 'package:bitdrill/screen/auth/signin.dart';
import 'package:bitdrill/utils/helper.dart';
import 'package:bitdrill/utils/helpers/textfeilds.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/my_images.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../../utils/my_styles.dart';
import '../../utils/ui_helper.dart';
import '../dashboard/dashboard.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isCheck = false;
  late double height;
  late double width;
  var selectedState;
  bool _obscureText = true;
  var countryCode;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController sponsorIdController = TextEditingController();
  List country = [];
  @override
  void initState() {
    // TODO: implement initState
    getCountryCode(context);
    super.initState();
  }
  void getCountryCode(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          getCountry(context).then((response) {
            setState(() {
              country = json.decode(response.body)['countrylist'];
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
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: country.isNotEmpty ? Consumer<AuthProvider>(
          builder: (context, provider, child) {
            return Container(
              color: MyAppTheme.whiteColor,
              height: height,
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10).copyWith(top: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CircleAvatar(
                      foregroundImage: AssetImage(MyImages.thisProject),
                      radius: height*0.10,
                    ),
                    black20Text("Sign Up Your account"),
                    SizedBox(height: 10,),
                    customTextField(
                        hintText: "Enter Your SponsorId",
                        controller: sponsorIdController,
                        prefixIcon: Icon(Icons.person,color: MyAppTheme.blackColor,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        mainBtn(text: 'Check User Exist',
                            width: width*.5,
                            onTap: (){
                                 provider.sendCheckSponsorId(context, sponsorIdController.text);
                            }),
                      ],
                    ),

                /*    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: (){},
                            child: SizedBox(
                                height: 50,
                                width: 50,
                                child: Icon(Icons.arrow_drop_down,size: 35,color: MyAppTheme.blackLightColor,))),

                        SizedBox(
                          width: width*.6,
                          child: underLineTextField(
                              hintText: "Enter Your Mobile No",
                              controller: mobileController),
                        ),
                      ],
                    ),*/
                    const SizedBox(height: 6,),
                    customTextField(
                        hintText: "Enter Your Full Name",
                        controller: nameController,prefixIcon: Icon(Icons.person,color: MyAppTheme.blackColor,)),
                    const SizedBox(height: 6,),
                    Container(
                      width: width,
                      margin: const EdgeInsets.only(top: 2.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(5))
                      ),
                      child:  DropdownButtonHideUnderline(
                        child: Theme(data: Theme.of(context).copyWith(
                          canvasColor: Colors.white,
                        ), child: CustomSearchableDropDown(
                          dropdownBackgroundColor: Colors.white,
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          items: country,
                          label:  selectedState ?? 'Select Country',
                          dropdownItemStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          primaryColor: Colors.black,
                          dropDownMenuItems: country.map((item) {
                            return item ['country_name'];
                          }).toList() ??
                              [],
                          onChanged: (value){
                            if(value!=null)
                            {
                              countryCode = value['phone_code'].toString();
                              print('country code ${countryCode}');
                            }
                            else{
                              countryCode=null;
                            }
                          },
                        ))
                        ,
                      ),
                    ),
                    const SizedBox(height: 6,),
                    customTextField(
                        hintText: "Enter Your Phone",
                        controller: mobileController,prefixIcon: Icon(Icons.phone_android,color: MyAppTheme.blackColor,)),
                    const SizedBox(height: 6,),
                    customTextField(
                        hintText: "Enter Your Email",
                        controller: emailController,prefixIcon: Icon(Icons.email,color: MyAppTheme.blackColor,)),
                    const SizedBox(height: 6,),
                    passwordTextField(
                        hintText: "Enter Your Password",
                        isObscureText: _obscureText,
                        onEyeTap: (){
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        controller: passController,prefixIcon: Icon(Icons.lock,color: MyAppTheme.blackColor,)),
                    const SizedBox(height: 6,),
                    passwordTextField(
                        hintText: "Enter Your Retype Password",
                        isObscureText: _obscureText,
                        onEyeTap: (){
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        controller: confirmPassController,prefixIcon: Icon(Icons.lock,color: MyAppTheme.blackColor,)),

                    Row(
                      children: [
                        Checkbox(value: isCheck, onChanged: (value) => setState(() {
                          isCheck = value!;
                        }),),
                        Expanded(child: blackLight12Text('By clicking this for sign up, you are agreed to your Terms & conditions')),
                      ],
                    ),
                    mainBtn(text: 'Sign Up',
                        width: width*.7,
                        onTap: (){
                          provider.authRegisterData(context,sponsorIdController.text,nameController.text,mobileController.text,emailController.text,passController.text,countryCode);
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        black14Text(alreadyHaveAccount),
                        const SizedBox(width: 5,),
                        GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn(),));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                signIn,
                                style: MyStyles.black16BoldStyle,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        )
         : SizedBox(),
      ),
    );
  }
}
