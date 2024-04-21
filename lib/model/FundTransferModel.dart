class FundTransferModel {
  int? status;
  String? msg;
  String? memberID;
  String? withdraAmount;

  FundTransferModel({this.status, this.msg, this.memberID, this.withdraAmount});

  FundTransferModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['Msg'];
    memberID = json['MemberID'];
    withdraAmount = json['WithdraAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Msg'] = this.msg;
    data['MemberID'] = this.memberID;
    data['WithdraAmount'] = this.withdraAmount;
    return data;
  }
}