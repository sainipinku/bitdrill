class PackegaIdModel {
  int? status;
  List<Packagelist>? packagelist;

  PackegaIdModel({this.status, this.packagelist});

  PackegaIdModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['packagelist'] != null) {
      packagelist = <Packagelist>[];
      json['packagelist'].forEach((v) {
        packagelist!.add(new Packagelist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.packagelist != null) {
      data['packagelist'] = this.packagelist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Packagelist {
  int? packageid;
  String? packagename;

  Packagelist({this.packageid, this.packagename});

  Packagelist.fromJson(Map<String, dynamic> json) {
    packageid = json['packageid'];
    packagename = json['packagename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['packageid'] = this.packageid;
    data['packagename'] = this.packagename;
    return data;
  }
}