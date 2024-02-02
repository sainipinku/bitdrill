// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:kidsstorybooks/locator.dart';
// import 'package:kidsstorybooks/providers/story_provider.dart';
// import 'package:kidsstorybooks/providers/subscription_provider.dart';
// import 'package:kidsstorybooks/screen/home_screen/story_listing_screen.dart';
// import 'package:provider/provider.dart';
// import '../config/shared_prefs.dart';
// import '../repository/create_profile_repo.dart';
// import '../utils/helper.dart';
// import '../utils/my_images.dart';
// import '../utils/ui_helper.dart';
//
// class ProfileProvider extends ChangeNotifier{
//   List allGenre =[];
//   int selectedIndex = 0;
//   int selectedGender = 0;
//   List selectedInterest = [];
//   String name ='';
//   String email ='';
//   String age ='';
//   String uuid ='';
//   List avatars =[
//     MyImages.avatar1,
//     MyImages.avatar2,
//     MyImages.avatar3,
//     MyImages.avatar4,
//   ];
//
//   initValue(){
//     selectedIndex =0;
//     selectedGender =0;
//     selectedInterest =[];
//     notifyListeners();
//   }
//
//   fillValues(Map myData){
//     var tempData = myData['data']["0"]['profile_category'];
//     var mData =myData['data']["0"];
//     debugPrint (tempData.toString());
//
//     selectedInterest.clear();
//     for(var element in tempData){
//       debugPrint ('-----------------------------');
//       debugPrint (element.toString());
//       debugPrint ('-----------------------------');
//       selectedInterest.add(element["genre_id"]);
//     }
//     //debugPrint({mData[''] == 'black'}.toString());
//     debugPrint({mData['gender']}.toString());
//     // debugPrint({mData['color'] == 'black'}.toString());
//     // debugPrint({mData['color'] == 'black'}.toString());
//     selectedIndex = myData['data']["0"]['avatar_index'];
//     selectedGender = myData['data']["0"]['gender'] == 'm' ? 0 : 1;
//     name= myData['data']["0"]['name'];
//     age= myData['data']["0"]['age'].toString();
//     email = myData['data']['user_email']??"";
//
//     notifyListeners();
//     debugPrint('selectedIndex -> $selectedIndex');
//     debugPrint('selectedGender -> $selectedGender');
//     debugPrint('selectedInterest -> $selectedInterest');
//     debugPrint('name -> $name');
//     debugPrint('age -> $age');
//   }
//
//   selectProfileImgIndex(int index){
//     selectedIndex = index;
//     notifyListeners();
//
//   }
//   selectGenderIndex(int index){
//     selectedGender = index;
//     notifyListeners();
//   }
//
//
//
//   onTapOfInterestsContainer(int index){
//     if(selectedInterest.contains(allGenre[index]['id'])){
//       selectedInterest.remove(allGenre[index]['id']);
//       notifyListeners();
//     }else{
//       selectedInterest.add(allGenre[index]['id']);
//       notifyListeners();
//     }
//   }
//
//   getAllGenre({required BuildContext context}){
//     try {
//       Helpers.verifyInternet().then((internet) {
//         if (internet) {
//           childInterestRepo(context).then((response) async {
//             if(response.statusCode ==200 ){
//               if(json.decode(response.body)['status']==true) {
//                 allGenre.clear();
//                 debugPrint('Response of  getAllGenre--------------->${response.body}');
//                 allGenre = json.decode(response.body)['data'];
//                 notifyListeners();
//                 debugPrint('Response of allGenreList --------------->$allGenre');
//               }
//             }
//
//           });
//         } else {
//           Helpers.createErrorSnackBar(context, "Please check your internet connection");
//         }
//       });
//     } on PlatformException catch (err) {
//       msgToast(msg: err.toString());
//     }
//   }
//
//   homePageDataFun({required BuildContext context}){
//     try {
//       Helpers.verifyInternet().then((internet) {
//         if (internet) {
//           getUserChildrenDetailRepo(context).then((response) async {
//
//             if(response.statusCode ==200 ){
//               var myData= json.decode(response.body);
//               if(myData['status']==true) {
//                 debugPrint('Response of getUserChildrenDetail --------------->${response.body}');
//                 fillValues(myData);
//                 uuid = myData['data']["0"]['uuid'];
//                 Provider.of<StoryProvider>(context,listen: false).currentStory(context: context,uuid: uuid);
//                 SharedPrefs.setChildUUID(myData['data']["0"]['uuid']);
//                 debugPrint('UUID:- ${await SharedPrefs.getChildUUID()}');
//               }
//             }
//
//           });
//         } else {
//           Helpers.createErrorSnackBar(context, "Please check your internet connection");
//         }
//       });
//     } on PlatformException catch (err) {
//       msgToast(msg: err.toString());
//     }
//   }
//
//   getChildProfile({required BuildContext context}){
//     try {
//       Helpers.verifyInternet().then((internet) {
//         if (internet) {
//           getUserChildrenDetailRepo(context)
//               .then((response) async {
//
//             if(response.statusCode ==200 ){
//                 var myData= json.decode(response.body);
//             if(myData['status']==true) {
//               debugPrint('Response of getUserChildrenDetail --------------->${response.body}');
//               fillValues(myData);
//               uuid = myData['data']["0"]['uuid'];
//
//               SharedPrefs.setChildUUID(myData['data']["0"]['uuid']);
//               debugPrint('UUID:- ${await SharedPrefs.getChildUUID()}');
//             }}
//           });
//         } else {
//           Helpers.createErrorSnackBar(context, "Please check your internet connection");
//         }
//       });
//     } on PlatformException catch (err) {
//       msgToast(msg: err.toString());
//     }
//   }
//
//   createChildProfileFun({required BuildContext context,
//     required String name,
//     required String age,
//     required String gender,
//     required List interests,}){
//     try {
//       Helpers.verifyInternet().then((internet) {
//         if (internet) {
//           createChildProfileRepo(context: context, name: name, age: age, gender: gender, avatarIndex: selectedIndex, interests: interests)
//               .then((response) async {
//             if(response.statusCode ==200 ){
//               if(json.decode(response.body)['status']==true) {
//                 debugPrint('Response of  createChildProfile --------------->${response.body}');
//                 SharedPrefs.setChildUUID(json.decode(response.body)['data']['uuid'].toString());
//                 debugPrint('UUID:- ${await SharedPrefs.getChildUUID()}');
//                 locator<SubscriptionProvider>().getSubscriptionDetails(context: context);
//               }
//             }
//           });
//         } else {
//           Helpers.createErrorSnackBar(context, "Please check your internet connection");
//         }
//       });
//     } on PlatformException catch (err) {
//       msgToast(msg: err.toString());
//     }
//   }
//
//
//   updateChildProfileFun({required BuildContext context,
//     required String name,
//     required String age,
//     required String gender,
//     required int avatarIndex,
//     required List interests,}){
//     try {
//       Helpers.verifyInternet().then((internet) {
//         if (internet) {
//           updateChildProfileRepo(context: context,
//               uuid: uuid,
//               name: name, age: age, gender: gender, avatarIndex: avatarIndex, interests: interests)
//               .then((response) async {
//             if(response.statusCode ==200 ){
//             if(json.decode(response.body)['status']==true) {
//               debugPrint('Response of  createChildProfile--------------->${response.body}');
//               getChildProfile(context: context);
//               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HomePageScreen(),));
//             }}
//           });
//         } else {
//           Helpers.createErrorSnackBar(context, "Please check your internet connection");
//         }
//       });
//     } on PlatformException catch (err) {
//       msgToast(msg: err.toString());
//     }
//   }
// }