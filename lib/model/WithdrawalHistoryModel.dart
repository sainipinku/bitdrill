class WithdrawalHistoryModel {
  String? status;
  String? msg;
  List<Data>? data;

  WithdrawalHistoryModel({this.status, this.msg, this.data});

  WithdrawalHistoryModel.fromJson(Map<String, dynamic> json) {
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
  var iD;
  var memberDetail;
  var status;
  var transactionId;
  var reqAmount;
  var deduction;
  var netAmount;
  var requestDate;
  var walletaddress;

  Data(
      {this.iD,
        this.memberDetail,
        this.status,
        this.transactionId,
        this.reqAmount,
        this.deduction,
        this.netAmount,
        this.requestDate,
        this.walletaddress});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    memberDetail = json['Member Detail'];
    status = json['Status'];
    transactionId = json['Transaction Id'];
    reqAmount = json['ReqAmount'];
    deduction = json['Deduction'];
    netAmount = json['NetAmount'];
    requestDate = json['RequestDate'];
    walletaddress = json['walletaddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Member Detail'] = this.memberDetail;
    data['Status'] = this.status;
    data['Transaction Id'] = this.transactionId;
    data['ReqAmount'] = this.reqAmount;
    data['Deduction'] = this.deduction;
    data['NetAmount'] = this.netAmount;
    data['RequestDate'] = this.requestDate;
    data['walletaddress'] = this.walletaddress;
    return data;
  }
}