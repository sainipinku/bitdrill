class LoginModel {
  String? status;
  String? msrno;
  String? memberid;
  String? title;
  String? email;
  String? membername;
  String? dOB;
  String? gender;
  String? transactionpassword;
  String? mobile;
  String? address;
  String? url;

  LoginModel(
      {this.status,
        this.msrno,
        this.memberid,
        this.title,
        this.email,
        this.membername,
        this.dOB,
        this.gender,
        this.transactionpassword,
        this.mobile,
        this.address,
        this.url});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    msrno = json['msrno'];
    memberid = json['memberid'];
    title = json['title'];
    email = json['email'];
    membername = json['membername'];
    dOB = json['DOB'];
    gender = json['gender'];
    transactionpassword = json['transactionpassword'];
    mobile = json['mobile'];
    address = json['address'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['msrno'] = this.msrno;
    data['memberid'] = this.memberid;
    data['title'] = this.title;
    data['email'] = this.email;
    data['membername'] = this.membername;
    data['DOB'] = this.dOB;
    data['gender'] = this.gender;
    data['transactionpassword'] = this.transactionpassword;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['url'] = this.url;
    return data;
  }
}