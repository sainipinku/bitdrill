class DepositeFundsModel {
  int? status;
  String? msg;
  String? memberID;
  String? depositRequest;

  DepositeFundsModel({this.status, this.msg, this.memberID, this.depositRequest});

  DepositeFundsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    memberID = json['MemberID'];
    depositRequest = json['depositRequest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['MemberID'] = this.memberID;
    data['depositRequest'] = this.depositRequest;
    return data;
  }
}