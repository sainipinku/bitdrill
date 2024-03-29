import 'package:bitdrill/providers/auth_provider.dart';
import 'package:bitdrill/screen/auth/signup.dart';
import 'package:bitdrill/utils/helpers/textfeilds.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/my_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../../utils/my_styles.dart';
import '../../utils/ui_helper.dart';
import '../dashboard/dashboard.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isCheck = false;
  late double height;
  late double width;
  String? _password;
  bool _obscureText = true;
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController sponsorIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Consumer<AuthProvider>(
          builder: (context, provider, child) {
            return Container(
              height: height,
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10).copyWith(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        foregroundImage: AssetImage(MyImages.thisProject),
                        radius: height*0.10,
                      ),
                      black20Text("Login Your account"),
                      const SizedBox(height: 30,),
                      customTextField(
                          hintText: "Enter Customer Id",
                          controller: emailController,prefixIcon: Icon(Icons.email,color: MyAppTheme.whiteColor,)),
                      const SizedBox(height: 6,),
                      passwordTextField(
                          hintText: "Enter Your Password",
                          isObscureText: _obscureText,
                          onEyeTap: (){
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          controller: passController,prefixIcon: Icon(Icons.lock,color: MyAppTheme.whiteColor,)),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){},
                            child: black20Text(forgotPassword),
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      mainBtn(text: 'Sign In',
                          width: width*.7,
                          onTap: (){
                            provider.authLoginData(context, emailController.text, passController.text);
                          }),


                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      black14Text(doNotHaveAccount),
                      const SizedBox(width: 5,),
                      GestureDetector(
                          onTap: (){

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUp(),));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              signUp,
                              style: MyStyles.black16BoldStyle,
                            ),
                          ))
                    ],
                  )
                ],
              )

            );
          },
        )
        ,
      ),
    );
  }
}
