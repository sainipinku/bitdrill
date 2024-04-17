import 'dart:async';
import 'dart:convert';

import 'package:bitdrill/dilog_box/showdilogbox.dart';
import 'package:bitdrill/model/ActivationModel.dart';
import 'package:bitdrill/model/DepositModel.dart';
import 'package:bitdrill/model/DepositeFundsModel.dart';
import 'package:bitdrill/model/LastClosingModel.dart';
import 'package:bitdrill/model/MessageModel.dart';
import 'package:bitdrill/model/TypeModel.dart';
import 'package:bitdrill/model/WithDrawModel.dart';
import 'package:bitdrill/model/home_model.dart';
import 'package:bitdrill/repository/auth_repository.dart';
import 'package:bitdrill/repository/home_repositroy.dart';
import 'package:bitdrill/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  HomeModel? homeModel;
  DepositModel? depositModel;
  ActivationModel? activationModel;
  DepositeFundsModel? depositeFundsModel;
  WithDrawModel? withDrawModel;
  MessageModel? messageModel;
  TypeModel? typeModel;
  String? totlaAmount;
  int reminingTime = 0;
  String reminingDate = '';
  int ghours = 00;
  int gminutes = 00;
  int gseconds = 00;
  int hours = 06;
  int minutes = 00;
  int seconds = 00;
  bool display = false;
  late Timer _timer;
  void timerClose(){
    _timer.cancel();
    notifyListeners();
  }
  void changeAmount (String value){
    totlaAmount = value;
    notifyListeners();
  }
  callCountDownTimer(){
    _timer = Timer.periodic(Duration(seconds: 1), _updateTimer);
  }
  void _updateTimer(Timer timer) {
    if (hours == 0 && minutes == 0 && seconds == 0) {
      timer.cancel();
      display = false;
    } else if (minutes == 0 && seconds == 0) {
      hours -= 1;
      minutes = 59;
      seconds = 59;
    } else if (seconds == 0) {
      minutes -= 1;
      seconds = 59;
    } else {
      seconds -= 1;
    }
    notifyListeners();
  }
  void getHomeData(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          homeData(context).then((response) {
            homeModel = response;
            notifyListeners();
          });
        } else {
          Helpers.createErrorSnackBar(context, "Please check your internet connection");
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }
  void getLastClosingDat(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          lastClosingData(context).then((response) {
            if(json.decode(response.body)['status'] == "1"){
              reminingTime = json.decode(response.body)['data'][0]['totHours'];
              reminingDate = json.decode(response.body)['data'][0]['IncomeDate'];
              // Define the correct date format pattern to match your input string
              print('time format=========${reminingTime}');
              // Remove extra spaces from the time string
              // Get the current date and time
              DateTime now = DateTime.now();
              reminingDate = reminingDate.replaceAll(RegExp(r'\s+'), ' ');

              // Define the date format pattern to match your input string
              DateFormat format = DateFormat("MMM d yyyy hh:mma");

              try {
                // Parse the time string into a DateTime object
                DateTime time = format.parse(reminingDate);
                // Subtract the duration from the current date and time

                /// Extract the hour, minute, and second components
                int hour = time.hour;
                int minute = time.minute;
                int second = time.second;
                // Define the duration to subtract (e.g., 2 hours, 30 minutes, 15 seconds)
                Duration durationToSubtract = Duration(hours: hour, minutes: minute, seconds: second);

                // Subtract the duration from the current date and time
                DateTime newDateTime = now.subtract(durationToSubtract);

                // Extract the hour, minute, and second components
                ghours = newDateTime.hour;
                gminutes = newDateTime.minute;
                gseconds = newDateTime.second;

                print('Time: $ghours:$gminutes:$gseconds');
                reminingTime == 0 ? null : reminingTime >= 6 || (reminingTime < 6 && reminingTime > 0) ? callCountDownTimer() : null;
              } catch (e) {
                print('Failed to parse time: $e');
              }
              notifyListeners();
            }else {
              Helpers.createErrorSnackBar(context,'No Record');
            }

          });
        } else {
          Helpers.createErrorSnackBar(context, "Please check your internet connection");
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }
  void sendWithdrawalHomeData(BuildContext context,String amount) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          withdrawalHomeData(context,amount).then((response) {
            withDrawModel = response;
            Navigator.pop(context);
            Helpers.createSnackBar(context, withDrawModel!.msg!);
            notifyListeners();
          });
        } else {
          Helpers.createErrorSnackBar(context, "Please check your internet connection");
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }
  void sendlevelNoData(BuildContext context,String status,String leavelno) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          levelNoData(context,status,leavelno).then((response) {
            typeModel = response;
            notifyListeners();
          });
        } else {
          Helpers.createErrorSnackBar(context, "Please check your internet connection");
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }
  void sendCenterHomeData(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          centerHomeData(context).then((response) {
            messageModel = response;
         /*   showDialog(
                barrierDismissible: true,
                context: context,
                builder: (_) =>  ShowDilogBox(message: messageModel!.msg!,)
            ).then((val) {

            });*/
            getLastClosingDat(context);
            notifyListeners();
          });
        } else {
          Helpers.createErrorSnackBar(context, "Please check your internet connection");
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }
  void sendDepositHomeData(BuildContext context,String request,String transaciton,String remark) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          depositHomeData(context,request,transaciton,remark).then((response) {
            depositeFundsModel = response;
            Navigator.pop(context);
            Helpers.createSnackBar(context, depositeFundsModel!.msg!);
            notifyListeners();
          });
        } else {
          Helpers.createErrorSnackBar(context, "Please check your internet connection");
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }
  void getttDepositDetailsHomeData(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          getDepositDetailsHomeData(context).then((response) {
            depositModel = response;
            notifyListeners();
          });
        } else {
          Helpers.createErrorSnackBar(context, "Please check your internet connection");
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }
  void sendFundTransferHomeData(BuildContext context,String amount) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          fundTransferHomeData(context,amount).then((response) {
            depositModel = response;
            Navigator.pop(context);
            notifyListeners();
          });
        } else {
          Helpers.createErrorSnackBar(context, "Please check your internet connection");
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }
  void sendActivationHomeData(BuildContext context,String amount,String pacgId) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          activationHomeData(context,amount,pacgId).then((response) {
            activationModel = response;
            totlaAmount = activationModel!.investamount;
            Helpers.createSnackBar(context, activationModel!.msg!);
            notifyListeners();
          });
        } else {
          Helpers.createErrorSnackBar(context, "Please check your internet connection");
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }
  void sendCompoundingHomeData(BuildContext context,String amount,String pacgId) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          compoundingHomeData(context,amount,pacgId).then((response) {
            activationModel = response;
            Helpers.createSnackBar(context, activationModel!.msg!);
            notifyListeners();
          });
        } else {
          Helpers.createErrorSnackBar(context, "Please check your internet connection");
        }
      });
    } catch (err) {
      print('Something went wrong');
    }
  }
}