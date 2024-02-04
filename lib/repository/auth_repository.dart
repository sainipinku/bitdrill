import 'dart:convert';

import 'package:bitdrill/apis/apis.dart';
import 'package:bitdrill/model/login_model.dart';
import 'package:bitdrill/utils/helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*Future authLogin(BuildContext context,String customerid,String password) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  print("login=======${ApiUrls.loginApi}?customerid=$customerid&password=$password");
  Uri url;
  url = Uri.parse("${ApiUrls.loginApi}?customerid=$customerid&password=$password");
  var headers = {
    'Content-Type': 'application/json',
    "Accept": "application/json",
  };
*//*  var map = <String, dynamic>{};
  map['device_id'] = Preferences.deviceId;
  map['device_token'] = Preferences.deviceToken;
  map['device_type'] = Preferences.deviceType;
  map['phone'] = phone;
  map['type'] = role;*//*
  http.Response response = await http.post(
    url,
    headers: headers,
   // body: json.encode(map),
  );
  print("status code ${response.statusCode}");
  if (response.statusCode == 200) {
    return response;
  } else {
    Helpers.hideLoader(loader);
    if (kDebugMode) {
      print(response.statusCode);
    }
  }
}*/

/*
Future authLogin(BuildContext context,String customerid,String password) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  print("login=======${ApiUrls.loginApi}?customerid=$customerid&password=$password");
  Uri url;
  url = Uri.parse("${ApiUrls.loginApi}?customerid=$customerid&password=$password");
  var headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  http.Response response = await http.get(
      url, headers: headers
  ).catchError((error) {
    // handle error here
    if (kDebugMode) {
      print(error);
    }
  });
  if (response.statusCode == 200) {
    return response;
  }else {
    if (kDebugMode) {
      print(response.statusCode);
    }
  }
}*/


Future<LoginModel> authLogin(BuildContext context,String customerid,String password) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/login?customerid=2558594&password=101011');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    /* body: jsonEncode(<String, String>{
      'objAuthoken': '987654321',
      'objUserName': email,
      'objPassword': password,
    }
    ),*/
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
  //  Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    return  LoginModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
   // Helpers.createSnackBar(context, json.decode(response.body)['message'].toString());
    throw new Exception(response.body);

  }

}