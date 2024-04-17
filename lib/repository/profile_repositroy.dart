
import 'package:bitdrill/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


Future changePassword(BuildContext context,String oldPass,String newPass) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/changepassword?msrno=$userToken&NewPassword=$newPass&oldpassword=$oldPass');
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

Future editProfileData(BuildContext context,String phone,String email,String walletAddress) async
{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userToken = prefs.getString('user_msrno') ?? '';
  var url;
  url = Uri.parse('https://api.bitdrill.world/Service.svc/editprofile?msrno=$userToken&mobile=$phone&emailid=$email&bank=&AccountNumber=&IFSCCode=&Address=&country=&state=&city=&pin=&walletaddress=$walletAddress&pan=&aadhar=&otp=');
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