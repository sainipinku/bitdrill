import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {

  /////////// Setters/////////////
  static setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_token', token);
  }

  static setLoginType(int role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('user_type', role);
  }
  static setUserId(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('user_id', userId);
  }
  static setChildUUID(String uuid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('child_uuid', uuid);
  }
  static setLoginStatus(String status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('logged_in', status);
  }
  static setProfileImage(String status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('pro_pic', status);
  }
  static setName(String status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', status);
  }
  static setEmail(String status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', status);
  }
  static setTrialFirstTimeUser(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('first_time_trial', status);
  }

  //////////Getters////////////////
  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_token') ?? " ";
  }
  static Future<int> getLoginType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('user_type') ?? -1;
  }
  static Future<int> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('user_id') ?? -1;
  }
  static Future<String> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('logged_in') ?? "";
  }
  static Future<String> getChildUUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('child_uuid') ?? "";
  }

  static Future<String> getProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('pro_pic') ?? "";
  }
  static Future<String> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name') ?? "";
  }
  static Future<String> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email') ?? "";
  }
  static Future<bool> getTrialFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('first_time_trial') ?? false;
  }

  ///remove all data
  static removeAll() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}



class SharedPrefs2 {


  static setFcmToken(String fcmToken) async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    debugPrint("hit Set FCM token");
    prefs2.setString('user_fcmToken', fcmToken);
  }

  //////////Getters////////////////

  static Future<String> getFcmToken() async {
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    debugPrint("hit Get FCM token");
    return prefs2.getString('user_fcmToken') ?? "";
  }
}
