class TypeModel {
  String? status;
  String? msg;
  List<Data>? data;

  TypeModel({this.status, this.msg, this.data});

  TypeModel.fromJson(Map<String, dynamic> json) {
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
  String? memberid;
  String? firstname;
  String? mobile;
  var packageName;
  String? email;
  String? memberStatus;
  String? filterStatus;
  String? doj;
  String? doa;
  int? msrno;
  int? level;

  Data(
      {this.memberid,
        this.firstname,
        this.mobile,
        this.packageName,
        this.email,
        this.memberStatus,
        this.filterStatus,
        this.doj,
        this.doa,
        this.msrno,
        this.level});

  Data.fromJson(Map<String, dynamic> json) {
    memberid = json['memberid'];
    firstname = json['Firstname'];
    mobile = json['mobile'];
    packageName = json['PackageName'];
    email = json['email'];
    memberStatus = json['memberStatus'];
    filterStatus = json['filterStatus'];
    doj = json['doj'];
    doa = json['doa'];
    msrno = json['Msrno'];
    level = json['Level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memberid'] = this.memberid;
    data['Firstname'] = this.firstname;
    data['mobile'] = this.mobile;
    data['PackageName'] = this.packageName;
    data['email'] = this.email;
    data['memberStatus'] = this.memberStatus;
    data['filterStatus'] = this.filterStatus;
    data['doj'] = this.doj;
    data['doa'] = this.doa;
    data['Msrno'] = this.msrno;
    data['Level'] = this.level;
    return data;
  }
}