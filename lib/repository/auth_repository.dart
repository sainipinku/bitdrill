import 'dart:convert';

import 'package:bitdrill/apis/apis.dart';
import 'package:bitdrill/model/country_model.dart';
import 'package:bitdrill/model/home_model.dart';
import 'package:bitdrill/model/login_model.dart';
import 'package:bitdrill/model/register_model.dart';
import 'package:bitdrill/utils/helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


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

Future<RegisterModel> authRegister(BuildContext context,String sponsorid,String membername,String mobile,String email,String pass,String countryid) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  print('${'register?sponsor=$sponsorid&Title=&membername=$membername&mobile=$mobile&EmailID=$email&Password=$pass&Address=&countryid=$countryid&AccountNumber=&IFSCCode=&WalletTRXAddress='}');
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/register?sponsor=$sponsorid&Title=&membername=$membername&mobile=$mobile&EmailID=$email&Password=$pass&Address=&countryid=$countryid&AccountNumber=&IFSCCode=&WalletTRXAddress=');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  RegisterModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}

Future getCountry(BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/countrylist');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    return response;

  } else {
    Helpers.hideLoader(loader);
    print('status flause');
    throw new Exception(response.body);

  }

}

Future sendCheckSponsor(BuildContext context,String sponsorid) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/checksponsor?memberid=$sponsorid');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    return response;

  } else {
    Helpers.hideLoader(loader);
    print('status flause');
    throw new Exception(response.body);

  }

}