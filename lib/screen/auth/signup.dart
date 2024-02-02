import 'package:bitdrill/screen/auth/signin.dart';
import 'package:bitdrill/utils/helpers/textfields.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:flutter/material.dart';

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

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController sponsorIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: MyAppTheme.whiteColor,
          height: height,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10).copyWith(top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                black16Text("Sign Up"),
                const SizedBox(height: 6,),
                blackLight12Text("Let's Start To Earn"),
                const SizedBox(height: 6,),
                customTextField(
                    hintText: "Enter Your SponsorId",
                    controller: nameController,
                    prefixIcon: Icon(Icons.person,color: MyAppTheme.blackColor,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    mainBtn(text: 'Check User Exist',
                        width: width*.5,
                        onTap: (){}),
                  ],
                ),
                
                Row(
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
                ),
                const SizedBox(height: 6,),
                customTextField(
                    hintText: "Enter Your Full Name",
                    controller: sponsorIdController,prefixIcon: Icon(Icons.person,color: MyAppTheme.blackColor,)),
                const SizedBox(height: 6,),
                customTextField(
                    hintText: "Enter Your Email",
                    controller: emailController,prefixIcon: Icon(Icons.email,color: MyAppTheme.blackColor,)),
                const SizedBox(height: 6,),
                passwordTextField(
                    hintText: "Enter Your Password",
                    controller: passController,prefixIcon: Icon(Icons.lock,color: MyAppTheme.blackColor,)),
                const SizedBox(height: 6,),
                passwordTextField(
                    hintText: "Enter Your Retype Password",
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
                    onTap: (){}),
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
        ),
      ),
    );
  }
}
