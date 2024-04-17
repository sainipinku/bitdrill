class LastClosingModel {
  String? status;
  String? msg;
  List<Data>? data;

  LastClosingModel({this.status, this.msg, this.data});

  LastClosingModel.fromJson(Map<String, dynamic> json) {
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
  String? incomeDate;
  int? totHours;

  Data({this.incomeDate, this.totHours});

  Data.fromJson(Map<String, dynamic> json) {
    incomeDate = json['IncomeDate'];
    totHours = json['totHours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IncomeDate'] = this.incomeDate;
    data['totHours'] = this.totHours;
    return data;
  }
}