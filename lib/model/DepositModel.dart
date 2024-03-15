class DepositModel {
  String? status;
  String? msg;
  List<Data>? data;

  DepositModel({this.status, this.msg, this.data});

  DepositModel.fromJson(Map<String, dynamic> json) {
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
  String? walletAddress;
  String? qrcodeurl;

  Data({this.walletAddress, this.qrcodeurl});

  Data.fromJson(Map<String, dynamic> json) {
    walletAddress = json['wallet_address'];
    qrcodeurl = json['qrcodeurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wallet_address'] = this.walletAddress;
    data['qrcodeurl'] = this.qrcodeurl;
    return data;
  }
}