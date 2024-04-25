class P2PHistoryModel {
  var status;
  List<FundTransferHistory>? fundTransferHistory;

  P2PHistoryModel({this.status, this.fundTransferHistory});

  P2PHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['fund_transfer_history'] != null) {
      fundTransferHistory = <FundTransferHistory>[];
      json['fund_transfer_history'].forEach((v) {
        fundTransferHistory!.add(new FundTransferHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.fundTransferHistory != null) {
      data['fund_transfer_history'] =
          this.fundTransferHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FundTransferHistory {
  var memberid;
  var firstname;
  var mobile;
  var createDate;
  var amount;
  var balance;
  var factor;
  var narration;

  FundTransferHistory(
      {this.memberid,
        this.firstname,
        this.mobile,
        this.createDate,
        this.amount,
        this.balance,
        this.factor,
        this.narration});

  FundTransferHistory.fromJson(Map<String, dynamic> json) {
    memberid = json['memberid'];
    firstname = json['firstname'];
    mobile = json['mobile'];
    createDate = json['CreateDate'];
    amount = json['Amount'];
    balance = json['Balance'];
    factor = json['Factor'];
    narration = json['Narration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memberid'] = this.memberid;
    data['firstname'] = this.firstname;
    data['mobile'] = this.mobile;
    data['CreateDate'] = this.createDate;
    data['Amount'] = this.amount;
    data['Balance'] = this.balance;
    data['Factor'] = this.factor;
    data['Narration'] = this.narration;
    return data;
  }
}