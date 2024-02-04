import 'package:bitdrill/model/login_model.dart';
import 'package:bitdrill/repository/auth_repository.dart';
import 'package:bitdrill/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthProvider extends ChangeNotifier {
   LoginModel? loginModel;
  void authLoginData(BuildContext context,String customerid,String password){
    authLogin(context,customerid,password)
        .then((response) {
          loginModel = response;
          notifyListeners();
          print("response============${loginModel!.title}");
    });
  }
}