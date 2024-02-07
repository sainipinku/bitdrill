class CountryModel {
  int? status;
  List<Countrylist>? countrylist;

  CountryModel({this.status, this.countrylist});

  CountryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['countrylist'] != null) {
      countrylist = <Countrylist>[];
      json['countrylist'].forEach((v) {
        countrylist!.add(new Countrylist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.countrylist != null) {
      data['countrylist'] = this.countrylist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countrylist {
  int? countryID;
  int? id;
  int? phoneCode;
  String? countryCode;
  String? countryName;

  Countrylist(
      {this.countryID,
        this.id,
        this.phoneCode,
        this.countryCode,
        this.countryName});

  Countrylist.fromJson(Map<String, dynamic> json) {
    countryID = json['CountryID'];
    id = json['id'];
    phoneCode = json['phone_code'];
    countryCode = json['country_code'];
    countryName = json['country_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CountryID'] = this.countryID;
    data['id'] = this.id;
    data['phone_code'] = this.phoneCode;
    data['country_code'] = this.countryCode;
    data['country_name'] = this.countryName;
    return data;
  }
}