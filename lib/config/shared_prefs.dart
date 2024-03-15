import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {

  /////////// Setters/////////////
  static setMSRNO(String user_msrno) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_msrno', user_msrno);
  }

  static setMemberId(String memberid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_memberid', memberid);
  }
  static setUserId(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('user_id', userId);
  }
  static setTrialFirstTimeUser(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('first_time_trial', status);
  }

  //////////Getters////////////////
  static Future<String> getMSRNO() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_msrno') ?? " ";
  }
  static Future<String> getMemberId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_type') ?? "";
  }
  static Future<int> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('user_id') ?? -1;
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
