

import 'dart:convert';

import 'package:bitdrill/repository/profile_repositroy.dart';
import 'package:bitdrill/utils/helper.dart';
import 'package:flutter/material.dart';


class ProfileProvider extends ChangeNotifier {
  void sendChangePassword(BuildContext context,String oldPass,String newPass) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          changePassword(context,oldPass,newPass).then((response) {
            if(json.decode(response.body)['status'] == 1){
              Helpers.createSnackBar(context,'Change Password Succusfully ');
            }else {
              Helpers.createErrorSnackBar(context,'User Not Exit');
            }
          });
        } else {
          Helpers.createErrorSnackBar(context, "Please check your internet connection");
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }

  void sendEditProfileData(BuildContext context,String phone,String email,String walletAddress) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          editProfileData(context,phone,email,walletAddress).then((response) {
            if(json.decode(response.body)['status'] == 1){
              Helpers.createSnackBar(context,'Change Password Succusfully ');
            }else {
              Helpers.createErrorSnackBar(context,'User Not Exit');
            }
          });
        } else {
          Helpers.createErrorSnackBar(context, "Please check your internet connection");
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }
}
