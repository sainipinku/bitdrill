import 'package:bitdrill/model/CompoundDailyIncomeModel.dart';
import 'package:bitdrill/model/DailyMiningModel.dart';
import 'package:bitdrill/model/DirectIncomeCompoundModel.dart';
import 'package:bitdrill/model/DirectIncomeModel.dart';
import 'package:bitdrill/model/LevelIncomeCompundingModel.dart';
import 'package:bitdrill/model/LevelIncomeModel.dart';
import 'package:bitdrill/repository/report_repository.dart';
import 'package:bitdrill/utils/helper.dart';
import 'package:flutter/material.dart';

class ReportProvider extends ChangeNotifier {
  DailyMiningModel? dailyMiningModel;
  DirectIncomeModel? directIncomeModel;
  LevelIncomeModel? levelIncomeModel;
  CompoundDailyIncomeModel? compoundDailyIncomeModel;
  DirectIncomeCompoundModel? directIncomeCompoundModel;
  LevelIncomeCompundingModel? levelIncomeCompundingModel;
  void getDailyIncome(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          dailyIncome(context).then((response) {
            dailyMiningModel = response;
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
  void sendcompoundDailyIncomeModel(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          getCompoundDailyIncomeModel(context).then((response) {
            compoundDailyIncomeModel = response;
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
  void sendDirectIncomeCompoundModel(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          getDirectIncomeCompoundModel(context).then((response) {
            directIncomeCompoundModel = response;
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
  void getDirectIncome(BuildContext context) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          DirectIncome(context).then((response) {
            directIncomeModel = response;
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
  void getLevelIncomeData(BuildContext context,String levelno) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          LevelIncomeData(context,levelno).then((response) {
            levelIncomeModel = response;
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

  void getLevelincomecompunding(BuildContext context,String levelno) async {
    try {
      Helpers.verifyInternet().then((intenet) {
        if (intenet) {
          levelincomecompunding(context,levelno).then((response) {
            levelIncomeCompundingModel = response;
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