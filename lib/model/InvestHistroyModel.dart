  class InvestHistroyModel {
  String? status;
  String? msg;
  List<Data>? data;

  InvestHistroyModel({this.status, this.msg, this.data});

  InvestHistroyModel.fromJson(Map<String, dynamic> json) {
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
  int? msrno1;
  String? investAmount;
  String? memberid;
  String? memberName;
  String? mstatus;
  String? adddate;

  Data(
      {this.msrno1,
        this.investAmount,
        this.memberid,
        this.memberName,
        this.mstatus,
        this.adddate});

  Data.fromJson(Map<String, dynamic> json) {
    msrno1 = json['msrno1'];
    investAmount = json['InvestAmount'];
    memberid = json['memberid'];
    memberName = json['MemberName'];
    mstatus = json['mstatus'];
    adddate = json['adddate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msrno1'] = this.msrno1;
    data['InvestAmount'] = this.investAmount;
    data['memberid'] = this.memberid;
    data['MemberName'] = this.memberName;
    data['mstatus'] = this.mstatus;
    data['adddate'] = this.adddate;
    return data;
  }
}