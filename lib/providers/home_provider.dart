import 'package:bitdrill/model/ActivationModel.dart';
import 'package:bitdrill/model/DepositModel.dart';
import 'package:bitdrill/model/DepositeFundsModel.dart';
import 'package:bitdrill/model/WithDrawModel.dart';
import 'package:bitdrill/model/home_model.dart';
import 'package:bitdrill/repository/auth_repository.dart';
import 'package:bitdrill/repository/home_repositroy.dart';
import 'package:bitdrill/utils/helper.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  HomeModel? homeModel;
  DepositModel? depositModel;
  ActivationModel? activationModel;
  DepositeFundsModel? depositeFundsModel;
  WithDrawModel? withDrawModel;
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