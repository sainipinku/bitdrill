class LevelIncomeCompundingModel {
  int? status;
  String? msg;
  List<Levelincome>? levelincome;

  LevelIncomeCompundingModel({this.status, this.msg, this.levelincome});

  LevelIncomeCompundingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['levelincome'] != null) {
      levelincome = <Levelincome>[];
      json['levelincome'].forEach((v) {
        levelincome!.add(new Levelincome.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.levelincome != null) {
      data['levelincome'] = this.levelincome!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Levelincome {
  int? msrno1;
  String? memberid;
  String? firstname;
  int? incomeLevelID;
  int? amount;
  bool? isPaid;
  String? addDate;
  int? levelNo;
  int? dueToMsrno;
  String? dueToid;
  String? dueToMember;

  Levelincome(
      {this.msrno1,
        this.memberid,
        this.firstname,
        this.incomeLevelID,
        this.amount,
        this.isPaid,
        this.addDate,
        this.levelNo,
        this.dueToMsrno,
        this.dueToid,
        this.dueToMember});

  Levelincome.fromJson(Map<String, dynamic> json) {
    msrno1 = json['msrno1'];
    memberid = json['memberid'];
    firstname = json['Firstname'];
    incomeLevelID = json['IncomeLevelID'];
    amount = json['Amount'];
    isPaid = json['IsPaid'];
    addDate = json['AddDate'];
    levelNo = json['LevelNo'];
    dueToMsrno = json['DueToMsrno'];
    dueToid = json['DueToid'];
    dueToMember = json['DueToMember'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msrno1'] = this.msrno1;
    data['memberid'] = this.memberid;
    data['Firstname'] = this.firstname;
    data['IncomeLevelID'] = this.incomeLevelID;
    data['Amount'] = this.amount;
    data['IsPaid'] = this.isPaid;
    data['AddDate'] = this.addDate;
    data['LevelNo'] = this.levelNo;
    data['DueToMsrno'] = this.dueToMsrno;
    data['DueToid'] = this.dueToid;
    data['DueToMember'] = this.dueToMember;
    return data;
  }
}