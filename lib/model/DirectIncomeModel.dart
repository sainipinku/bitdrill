class DirectIncomeModel {
  String? status;
  String? msg;
  List<Data>? data;

  DirectIncomeModel({this.status, this.msg, this.data});

  DirectIncomeModel.fromJson(Map<String, dynamic> json) {
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
  var amount;
  String? sponsorid;
  String? sponsorname;
  String? memberID;
  String? firstname;
  var amount1;
  String? addDate;

  Data(
      {this.amount,
        this.sponsorid,
        this.sponsorname,
        this.memberID,
        this.firstname,
        this.amount1,
        this.addDate});

  Data.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    sponsorid = json['sponsorid'];
    sponsorname = json['sponsorname'];
    memberID = json['MemberID'];
    firstname = json['firstname'];
    amount1 = json['Amount1'];
    addDate = json['AddDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['sponsorid'] = this.sponsorid;
    data['sponsorname'] = this.sponsorname;
    data['MemberID'] = this.memberID;
    data['firstname'] = this.firstname;
    data['Amount1'] = this.amount1;
    data['AddDate'] = this.addDate;
    return data;
  }
}