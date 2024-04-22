import 'dart:convert';
import 'package:bitdrill/model/CompoundDailyIncomeModel.dart';
import 'package:bitdrill/model/DailyMiningModel.dart';
import 'package:bitdrill/model/DirectIncomeCompoundModel.dart';
import 'package:bitdrill/model/DirectIncomeModel.dart';
import 'package:bitdrill/model/LevelIncomeModel.dart';
import 'package:bitdrill/model/LevelIncomeCompundingModel.dart';
import 'package:bitdrill/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



Future<DailyMiningModel> dailyIncome(BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/dailyincome?msrno=$userToken');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  DailyMiningModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}

Future<DirectIncomeModel> DirectIncome(BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/DirectIncome?msrno=$userToken');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  DirectIncomeModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}

Future<LevelIncomeModel> LevelIncomeData(BuildContext context,String levelno) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/levelincome?msrno=$userToken&levelno=$levelno');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  LevelIncomeModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}

Future<DirectIncomeCompoundModel> getDirectIncomeCompoundModel(BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/DirectIncomeCompound?msrno=$userToken');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  DirectIncomeCompoundModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}

Future<CompoundDailyIncomeModel> getCompoundDailyIncomeModel(BuildContext context) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/compounddailyincome?msrno=$userToken');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  CompoundDailyIncomeModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}

Future<LevelIncomeCompundingModel> levelincomecompunding(BuildContext context,String levelno) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/levelincomecompunding?msrno=$userToken&levelno=$levelno');
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('status true ==${response.body}');
    Helpers.hideLoader(loader);
    return  LevelIncomeCompundingModel.fromJson(json.decode(response.body));

  } else {
    print('status flause');
    Helpers.hideLoader(loader);
    throw new Exception(response.body);

  }

}
