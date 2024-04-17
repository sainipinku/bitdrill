import 'package:bitdrill/providers/profile_provider.dart';
import 'package:bitdrill/repository/profile_repositroy.dart';
import 'package:bitdrill/utils/constants.dart';
import 'package:bitdrill/utils/helper.dart';
import 'package:bitdrill/utils/helpers/textfeilds.dart';
import 'package:bitdrill/utils/my_app_theme.dart';
import 'package:bitdrill/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late double height;
  late double width;
  TextEditingController walletAddressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  void getUserDetails() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      emailController.text = prefs.getString('user_email') ?? '';
      mobileController.text = prefs.getString('user_phone') ?? '';
    });
    print('memeber id==========${prefs.getString('user_memberid')} member name==========${ prefs.getString('user_memeberName')}');

  }
  @override
  void initState() {
    // TODO: implement initState
    getUserDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    width =MediaQuery.sizeOf(context).width;
    height =MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(title: editProfile, backBtn: backBtn(context: context)),
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
                    customTextField(
                        hintText: "Enter Your Wallet Address",
                        controller: walletAddressController,prefixIcon: Icon(Icons.person,color: MyAppTheme.whiteColor,)),
                    phoneNumberTextfield(
                        controller: mobileController),
                    const SizedBox(height: 6,),
                    customTextField(
                        hintText: "Enter Your Email",
                        controller: emailController,prefixIcon: Icon(Icons.email,color: MyAppTheme.whiteColor,)),
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
                    provider.sendEditProfileData(context,mobileController.text,emailController.text,walletAddressController.text);
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
