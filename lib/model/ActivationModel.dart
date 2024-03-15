class ActivationModel {
  int? status;
  String? msg;
  String? memberID;
  String? investamount;

  ActivationModel({this.status, this.msg, this.memberID, this.investamount});

  ActivationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['Msg'];
    memberID = json['MemberID'];
    investamount = json['investamount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Msg'] = this.msg;
    data['MemberID'] = this.memberID;
    data['investamount'] = this.investamount;
    return data;
  }
}