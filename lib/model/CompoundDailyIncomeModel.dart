class CompoundDailyIncomeModel {
  int? status;
  String? msg;
  List<Dailyincome>? dailyincome;

  CompoundDailyIncomeModel({this.status, this.msg, this.dailyincome});

  CompoundDailyIncomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['dailyincome'] != null) {
      dailyincome = <Dailyincome>[];
      json['dailyincome'].forEach((v) {
        dailyincome!.add(new Dailyincome.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.dailyincome != null) {
      data['dailyincome'] = this.dailyincome!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dailyincome {
  int? msrno;
  String? memberid;
  String? name;
  int? incomeExtraFixedID;
  int? fixedNo;
  var amount;
  bool? isPaid;
  String? incomeDate;

  Dailyincome(
      {this.msrno,
        this.memberid,
        this.name,
        this.incomeExtraFixedID,
        this.fixedNo,
        this.amount,
        this.isPaid,
        this.incomeDate});

  Dailyincome.fromJson(Map<String, dynamic> json) {
    msrno = json['msrno'];
    memberid = json['memberid'];
    name = json['name'];
    incomeExtraFixedID = json['IncomeExtraFixedID'];
    fixedNo = json['FixedNo'];
    amount = json['Amount'];
    isPaid = json['IsPaid'];
    incomeDate = json['IncomeDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msrno'] = this.msrno;
    data['memberid'] = this.memberid;
    data['name'] = this.name;
    data['IncomeExtraFixedID'] = this.incomeExtraFixedID;
    data['FixedNo'] = this.fixedNo;
    data['Amount'] = this.amount;
    data['IsPaid'] = this.isPaid;
    data['IncomeDate'] = this.incomeDate;
    return data;
  }
}