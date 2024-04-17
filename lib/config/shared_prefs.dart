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
  static setMemberName(String memberName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_memeberName', memberName);
  }
  static setMemberPhone(String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_phone', phone);

  }
  static setMemberEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_email', email);

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
  static Future<String> getMemberName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_memeberName') ?? "";
  }
  static Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_email') ?? "";
  }
  static Future<String> getUserPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_phone') ?? "";
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
