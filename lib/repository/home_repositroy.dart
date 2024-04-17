import 'dart:convert';

import 'package:bitdrill/apis/apis.dart';
import 'package:bitdrill/model/ActivationModel.dart';
import 'package:bitdrill/model/DepositModel.dart';
import 'package:bitdrill/model/DepositeFundsModel.dart';
import 'package:bitdrill/model/LastClosingModel.dart';
import 'package:bitdrill/model/MessageModel.dart';
import 'package:bitdrill/model/PackegaIdModel.dart';
import 'package:bitdrill/model/TypeModel.dart';
import 'package:bitdrill/model/WithDrawModel.dart';
import 'package:bitdrill/model/country_model.dart';
import 'package:bitdrill/model/home_model.dart';
import 'package:bitdrill/model/login_model.dart';
import 'package:bitdrill/model/register_model.dart';
import 'package:bitdrill/utils/helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


Future<LoginModel> authLogin(BuildContext context,String customerid,String password) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/login?customerid=$customerid&password=$password');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  LoginModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}

Future<HomeModel> homeData(BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/dashboard?msrno=$userToken');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  HomeModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}

Future<WithDrawModel> withdrawalHomeData(BuildContext context,String amount) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/withdrwareqworking?msrno=$userToken&amount=$amount&otp=000&cryptotype=usdt');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  WithDrawModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}


Future<MessageModel> centerHomeData(BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/mining?msrno=$userToken&packid=1');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  MessageModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}

Future<DepositeFundsModel> depositHomeData(BuildContext context,String request,String transaciton,String remark) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/depositrequest?msrno=$userToken&amount=$request&referrance=$transaciton&remark=$remark&utr=$transaciton&screenshot=&cryptotype=usdt');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  DepositeFundsModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}

Future<DepositModel> getDepositDetailsHomeData(BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/coinqr?msrno=$userToken&cryptotype=');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  DepositModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}

Future<DepositModel> fundTransferHomeData(BuildContext context,String amount) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/fundtransfer?msrno=$userToken&loginmemberid=$userToken&amount=$amount&otp=00');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  DepositModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}

Future<ActivationModel> activationHomeData(BuildContext context,String amount,String pacgId) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_memberid') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/activation?memberid=$userToken&loginmemberid=$userToken&packageid=$pacgId&investamount=$amount&cryptotype=usdt');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  ActivationModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}

Future<ActivationModel> compoundingHomeData(BuildContext context,String amount,String pacgId) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_memberid') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/compounding?memberid=$userToken&loginmemberid=$userToken&packageid=$pacgId&investamount=$amount&cryptotype=usdt');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  ActivationModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}

Future pacakgeIdhomeData(BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/packagelist?msrno=$userToken');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  response;

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}

Future compoundpackageIdhomeData(BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/compoundpackage?msrno=$userToken');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  response;

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}

Future<TypeModel> levelNoData(BuildContext context,String status,String leavelno) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/level_team?msrno=$userToken&status=$status&levelno=$leavelno');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  TypeModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}


Future lastClosingData(BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/lastclosing?msrno=$userToken');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  response;

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}