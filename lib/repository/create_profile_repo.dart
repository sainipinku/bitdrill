// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:kidsstorybooks/config/shared_prefs.dart';
// import '../apis/apis.dart';
// import '../screen/auth/signup.dart';
// import '../utils/constants.dart';
// import '../utils/helper.dart';
// import '../utils/ui_helper.dart';
//
// Future childInterestRepo(BuildContext context) async {
//   // OverlayEntry loader = Helpers.overlayLoader(context);
//   // Overlay.of(context).insert(loader);
//   try {
//     Uri url;
//     url = Uri.parse(ApiUrls.childInterest);
//     var headers = {
//       'Content-Type': 'application/json',
//       "Accept": "application/json",
//       "Authorization": "Bearer ${await SharedPrefs.getToken()}",
//     };
//
//     http.Response response = await http.get(
//       url,
//       headers: headers,
//     );
//     debugPrint("status code ${response.statusCode}");
//
//     if (response.statusCode == 200) {
//       // print("All Genres ${response.body}");
//       // Helpers.hideLoader(loader);
//       bool status;
//       status = json.decode(response.body)['status'];
//       if (status == true) {
//         //Helpers.messageToastFalse(json.decode(response.body)['message']);
//         return response;
//       } else {
//         Helpers.messageToastFalse(json.decode(response.body)['message']);
//         return response;
//       }
//     } else if (response.statusCode == 400) {
//       // Helpers.hideLoader(loader);
//       Helpers.messageToastFalse(json.decode(response.body)['message']);
//       return response;
//     } else if (response.statusCode == 401) {
//       // Helpers.hideLoader(loader);
//       Navigator.pushAndRemoveUntil<dynamic>(
//         context,
//         MaterialPageRoute<dynamic>(
//           builder: (context) => const SignInScreen(),
//         ),
//         (route) => false,
//       );
//       SharedPrefs.removeAll();
//       return response;
//     } else if (response.statusCode == 403) {
//       // Helpers.hideLoader(loader);
//       Navigator.pushAndRemoveUntil<dynamic>(
//         context,
//         MaterialPageRoute<dynamic>(
//           builder: (context) => const SignInScreen(),
//         ),
//         (route) => false,
//       );
//       SharedPrefs.removeAll();
//       return response;
//     } else if (response.statusCode == 422) {
//       // Helpers.hideLoader(loader);
//       Helpers.messageToastFalse(json.decode(response.body)['message']);
//       return response;
//     } else if (response.statusCode == 500) {
//       // Helpers.hideLoader(loader);
//       Helpers.messageToastFalse(json.decode(response.body)['message']);
//       return response;
//     } else {
//       // Helpers.hideLoader(loader);
//       if (kDebugMode) {
//         print(response.statusCode);
//         return response;
//       }
//     }
//   } catch (e) {
//     debugPrint("in catch");
//     msgToast(msg: exceptionText);
//     debugPrint(e.toString());
//   }
// }
//
// Future getUserChildrenDetailRepo(BuildContext context) async {
//   OverlayEntry loader = Helpers.overlayLoader(context);
//   Overlay.of(context).insert(loader);
//   try {
//     Uri url;
//     url = Uri.parse(ApiUrls.getUserChildrenDetail);
//     var headers = {
//       'Content-Type': 'application/json',
//       "Accept": "application/json",
//       "Authorization": "Bearer ${await SharedPrefs.getToken()}",
//     };
//
//     http.Response response = await http.get(
//       url,
//       headers: headers,
//     );
//     debugPrint("status code ${response.statusCode}");
//
//     if (response.statusCode == 200) {
//       print("All Genres ${response.body}");
//       Helpers.hideLoader(loader);
//       bool status;
//       status = json.decode(response.body)['status'];
//       if (status == true) {
//         //Helpers.messageToastFalse(json.decode(response.body)['message']);
//         return response;
//       } else {
//         Helpers.messageToastFalse(json.decode(response.body)['message']);
//         return response;
//       }
//     } else if (response.statusCode == 400) {
//       Helpers.hideLoader(loader);
//       Helpers.messageToastFalse(json.decode(response.body)['message']);
//       return response;
//     } else if (response.statusCode == 401) {
//       Helpers.hideLoader(loader);
//       Navigator.pushAndRemoveUntil<dynamic>(
//         context,
//         MaterialPageRoute<dynamic>(
//           builder: (context) => const SignInScreen(),
//         ),
//         (route) => false,
//       );
//       SharedPrefs.removeAll();
//       return response;
//     } else if (response.statusCode == 403) {
//       Helpers.hideLoader(loader);
//       Navigator.pushAndRemoveUntil<dynamic>(
//         context,
//         MaterialPageRoute<dynamic>(
//           builder: (context) => const SignInScreen(),
//         ),
//         (route) => false,
//       );
//       SharedPrefs.removeAll();
//       return response;
//     } else if (response.statusCode == 422) {
//       Helpers.hideLoader(loader);
//       Helpers.messageToastFalse(json.decode(response.body)['message']);
//       return response;
//     } else if (response.statusCode == 500) {
//       Helpers.hideLoader(loader);
//       Helpers.messageToastFalse(json.decode(response.body)['message']);
//       return response;
//     } else {
//       Helpers.hideLoader(loader);
//       if (kDebugMode) {
//         print(response.statusCode);
//         return response;
//       }
//     }
//   } catch (e) {
//     debugPrint("in catch");
//     msgToast(msg: exceptionText);
//     Helpers.hideLoader(loader);
//     debugPrint(e.toString());
//   }
// }
//
// Future createChildProfileRepo({
//   required BuildContext context,
//   required String name,
//   required String age,
//   required String gender,
//   required int avatarIndex,
//   required List interests,
// }) async {
//   OverlayEntry loader = Helpers.overlayLoader(context);
//   Overlay.of(context).insert(loader);
//   try {
//     Uri url;
//     url = Uri.parse(ApiUrls.createChildProfile);
//     var headers = {
//       'Content-Type': 'application/json',
//       "Accept": "application/json",
//       "Authorization": "Bearer ${await SharedPrefs.getToken()}",
//     };
//
//     var map = <String, dynamic>{};
//     map['name'] = name;
//     map['age'] = age;
//     map['gender'] = gender;
//     map['interests'] = json.encode(interests);
//     map['avatar_index'] = avatarIndex;
//     debugPrint("Map $map");
//     debugPrint("Map ${json.encode(map)}");
//
//     http.Response response = await http.post(
//       url,
//       headers: headers,
//       body: json.encode(map),
//     );
//     debugPrint("status code ${response.statusCode}");
//
//     if (response.statusCode == 200) {
//       Helpers.hideLoader(loader);
//       bool status;
//       status = json.decode(response.body)['status'];
//       if (status == true) {
//         SharedPrefs.setTrialFirstTimeUser(true);
//         Helpers.messageToastFalse("Child Profile Created Successfully");
//         return response;
//       } else {
//         Helpers.messageToastFalse(json.decode(response.body)['message']);
//         return response;
//       }
//     } else if (response.statusCode == 400) {
//       Helpers.hideLoader(loader);
//       Helpers.messageToastFalse(json.decode(response.body)['message']);
//       return response;
//     } else if (response.statusCode == 401) {
//       Helpers.hideLoader(loader);
//       Navigator.pushAndRemoveUntil<dynamic>(
//         context,
//         MaterialPageRoute<dynamic>(
//           builder: (context) => const SignInScreen(),
//         ),
//         (route) => false,
//       );
//       SharedPrefs.removeAll();
//       return response;
//     } else if (response.statusCode == 403) {
//       Helpers.hideLoader(loader);
//       Navigator.pushAndRemoveUntil<dynamic>(
//         context,
//         MaterialPageRoute<dynamic>(
//           builder: (context) => const SignInScreen(),
//         ),
//         (route) => false,
//       );
//       SharedPrefs.removeAll();
//       return response;
//     } else if (response.statusCode == 422) {
//       Helpers.hideLoader(loader);
//       Helpers.messageToastFalse(json.decode(response.body)['message']);
//     } else if (response.statusCode == 500) {
//       Helpers.hideLoader(loader);
//       Helpers.messageToastFalse(json.decode(response.body)['message']);
//       return response;
//     } else {
//       Helpers.hideLoader(loader);
//       if (kDebugMode) {
//         print(response.statusCode);
//         return response;
//       }
//     }
//   } catch (e) {
//     debugPrint("in catch");
//     msgToast(msg: exceptionText);
//     Helpers.hideLoader(loader);
//     debugPrint(e.toString());
//   }
// }
//
// Future updateChildProfileRepo({
//   required BuildContext context,
//   required String uuid,
//   required String name,
//   required String age,
//   required String gender,
//   required int avatarIndex,
//   required List interests,
// }) async {
//   OverlayEntry loader = Helpers.overlayLoader(context);
//   Overlay.of(context).insert(loader);
//   try {
//     Uri url;
//     url = Uri.parse(ApiUrls.updateChildProfile + uuid);
//     debugPrint(ApiUrls.updateChildProfile + uuid);
//     var headers = {
//       'Content-Type': 'application/json',
//       "Accept": "application/json",
//       "Authorization": "Bearer ${await SharedPrefs.getToken()}",
//     };
//
//     var map = <String, dynamic>{};
//     map['name'] = name;
//     map['age'] = age;
//     map['gender'] = gender;
//     map['interests'] = json.encode(interests);
//     map['avatar_index'] = avatarIndex;
//     debugPrint("Map $map");
//     debugPrint("Map ${json.encode(map)}");
//
//     http.Response response = await http.post(
//       url,
//       headers: headers,
//       body: json.encode(map),
//     );
//     debugPrint("status code ${response.statusCode}");
//
//     if (response.statusCode == 200) {
//       Helpers.hideLoader(loader);
//       bool status;
//       status = json.decode(response.body)['status'];
//       if (status == true) {
//         Helpers.messageToastFalse("Child Profile Updated Successfully");
//         return response;
//       } else {
//         Helpers.messageToastFalse(json.decode(response.body)['message']);
//         return response;
//       }
//     } else if (response.statusCode == 400) {
//       Helpers.hideLoader(loader);
//       Helpers.messageToastFalse(json.decode(response.body)['message']);
//       return response;
//     } else if (response.statusCode == 401) {
//       Helpers.hideLoader(loader);
//       Navigator.pushAndRemoveUntil<dynamic>(
//         context,
//         MaterialPageRoute<dynamic>(
//           builder: (context) => const SignInScreen(),
//         ),
//         (route) => false,
//       );
//       SharedPrefs.removeAll();
//       return response;
//     } else if (response.statusCode == 403) {
//       Helpers.hideLoader(loader);
//       Navigator.pushAndRemoveUntil<dynamic>(
//         context,
//         MaterialPageRoute<dynamic>(
//           builder: (context) => const SignInScreen(),
//         ),
//         (route) => false,
//       );
//       SharedPrefs.removeAll();
//       return response;
//     } else if (response.statusCode == 422) {
//       Helpers.hideLoader(loader);
//       Helpers.messageToastFalse(json.decode(response.body)['message']);
//       return response;
//     } else if (response.statusCode == 500) {
//       Helpers.hideLoader(loader);
//       Helpers.messageToastFalse(json.decode(response.body)['message']);
//       return response;
//     } else {
//       Helpers.hideLoader(loader);
//       if (kDebugMode) {
//         print(response.statusCode);
//         return response;
//       }
//     }
//   } catch (e) {
//     debugPrint("in catch");
//     msgToast(msg: exceptionText);
//     Helpers.hideLoader(loader);
//     debugPrint(e.toString());
//   }
// }
