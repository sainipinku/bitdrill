class DepositeHistoryModel {
  String? status;
  String? msg;
  List<Data>? data;

  DepositeHistoryModel({this.status, this.msg, this.data});

  DepositeHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  var sWalletTransactionID;
  var memberID;
  var memberName;
  var amount;
  var balance;
  var date;
  var narration;
  var factor;
  var stStatus;

  Data(
      {this.sWalletTransactionID,
        this.memberID,
        this.memberName,
        this.amount,
        this.balance,
        this.date,
        this.narration,
        this.factor,
        this.stStatus});

  Data.fromJson(Map<String, dynamic> json) {
    sWalletTransactionID = json['SWalletTransactionID'];
    memberID = json['memberID'];
    memberName = json['MemberName'];
    amount = json['amount'];
    balance = json['balance'];
    date = json['Date'];
    narration = json['narration'];
    factor = json['factor'];
    stStatus = json['StStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SWalletTransactionID'] = this.sWalletTransactionID;
    data['memberID'] = this.memberID;
    data['MemberName'] = this.memberName;
    data['amount'] = this.amount;
    data['balance'] = this.balance;
    data['Date'] = this.date;
    data['narration'] = this.narration;
    data['factor'] = this.factor;
    data['StStatus'] = this.stStatus;
    return data;
  }
}