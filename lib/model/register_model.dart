class RegisterModel {
  int? status;
  String? membername;
  String? memberID;
  String? password;

  RegisterModel({this.status, this.membername, this.memberID, this.password});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    membername = json['membername'];
    memberID = json['MemberID'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['membername'] = this.membername;
    data['MemberID'] = this.memberID;
    data['Password'] = this.password;
    return data;
  }
}