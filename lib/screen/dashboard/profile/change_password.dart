import 'package:bitdrill/providers/home_provider.dart';
import 'package:bitdrill/providers/profile_provider.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/helper.dart';
import 'package:bitdrill/utils/helpers/textfeilds.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late double height;
  late double width;
  bool _obscureOldText = true;
  bool _obscureNesText = true;
  bool _obscureNewConfrmText = true;
  TextEditingController oldController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController newConfPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    width =MediaQuery.sizeOf(context).width;
    height =MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(title: changePassword, backBtn: backBtn(context: context)),
      body: Consumer<ProfileProvider>(
        builder: (context, provider, child) {
          return Container(
            color: MyAppTheme.bgColor,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    passwordTextField(
                        hintText: "Enter Your Old Password",
                        isObscureText: _obscureOldText,
                        onEyeTap: (){
                          setState(() {
                            _obscureOldText = !_obscureOldText;
                          });
                        },
                        controller: oldController,prefixIcon: Icon(Icons.lock,color: MyAppTheme.whiteColor,)),
                    passwordTextField(
                        hintText: "Enter Your New Password",
                        isObscureText: _obscureNesText,
                        onEyeTap: (){
                          setState(() {
                            _obscureNesText = !_obscureNesText;
                          });
                        },
                        controller: newPassController,prefixIcon: Icon(Icons.lock,color: MyAppTheme.whiteColor,)),
                    passwordTextField(
                        hintText: "Enter Your New Confirm Password",
                        isObscureText: _obscureNewConfrmText,
                        onEyeTap: (){
                          setState(() {
                            _obscureNewConfrmText = !_obscureNewConfrmText;
                          });
                        },
                        controller: newConfPassController,prefixIcon: Icon(Icons.lock,color: MyAppTheme.whiteColor,)),
                  ].map(
                        (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: e,
                    ),
                  ).toList(),
                ),
                SizedBox(
                  width: width,
                  child: mainBtn(text: save, onTap: (){
                      if(oldController.text.isNotEmpty){
                        if(newPassController.text == newConfPassController.text){
                          provider.sendChangePassword(context,oldController.text,newPassController.text);
                        }
                        else
                        {
                          Helpers.createSnackBar(context, 'Cannot Match');
                        }
                      }
                      else
                      {
                        Helpers.createSnackBar(context, 'Enter Old Password');
                      }

                  }),
                )

              ],
            ),
          );
        },
      ),
    );
  }
}
