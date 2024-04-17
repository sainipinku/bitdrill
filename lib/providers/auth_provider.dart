import 'dart:convert';

import 'package:bitdrill/config/shared_prefs.dart';
import 'package:bitdrill/dilog_box/register_dilogbox.dart';
import 'package:bitdrill/model/country_model.dart';
import 'package:bitdrill/model/login_model.dart';
import 'package:bitdrill/model/register_model.dart';
import 'package:bitdrill/repository/auth_repository.dart';
import 'package:bitdrill/screen/dashboard/dashboard.dart';

import 'package:bitdrill/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthProvider extends ChangeNotifier {
   LoginModel? loginModel;
   RegisterModel? registerModel;
   List country = [];
   bool _isLoading = false;
   bool get isLoading => _isLoading;
   CountryModel? countryModel;
   String sponserName = '';
  void authLoginData(BuildContext context,String customerid,String password){
    authLogin(context,customerid,password)
        .then((response) {
          loginModel = response;
          SharedPrefs.setMSRNO(loginModel!.msrno!);
          SharedPrefs.setMemberId(loginModel!.memberid!);
          SharedPrefs.setMemberName(loginModel!.membername!);
          SharedPrefs.setMemberEmail(loginModel!.email!);
          SharedPrefs.setMemberPhone(loginModel!.mobile!);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashBoard(),));
          notifyListeners();
          print("response============${loginModel!.title}");
    });
  }
   void authRegisterData(BuildContext context,String sponsorid,String membername,String mobile,String email,String pass,String countryid){
     authRegister(context,sponsorid,membername,mobile,email,pass,countryid)
         .then((response) {
       registerModel = response;
       if(registerModel!.status == 1){
         showDialog(
             barrierDismissible: true,
             context: context,
             builder: (_) =>  RegisterDilogBox(registerModel: registerModel!,)
         ).then((val) {

         });
         notifyListeners();
       }else {
         Helpers.createErrorSnackBar(context,'invalid cerdiction');
       }

       print("response============${loginModel!.title}");
     });
   }

   void sendCheckSponsorId(BuildContext context,String sponserid){
     sendCheckSponsor(context,sponserid)
         .then((response) {
         if(json.decode(response.body)['status'] == 1){
           sponserName = json.decode(response.body)['sponsorname'];
           Helpers.showValidationSnackBar(context,json.decode(response.body)['sponsorname']);
         }else {
           sponserName = "";
           Helpers.createErrorSnackBar(context,'User Not Exit');
         }
       notifyListeners();
       print("response sponser name============$sponserName");
     });
   }

}