class HomeModel {
  var status;
  List<Dashboard>? dashboard;

  HomeModel({this.status, this.dashboard});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['dashboard'] != null) {
      dashboard = <Dashboard>[];
      json['dashboard'].forEach((v) {
        dashboard!.add(new Dashboard.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.dashboard != null) {
      data['dashboard'] = this.dashboard!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dashboard {
  String? memberId;
  String? memberName;
  String? whatsappSupport;
  String? dOJ;
  var withdrawalWalletAddress;
  var otherwalletaddress;
  var dOA;
  String? directCountActiveTeam;
  String? directCountDeactiveTeam;
  String? refferlink;
  var isTrading;
  var isFinance;
  var isRealEstate;
  var isECommerce;
  String? accountNumber;
  String? iFSCCode;
  var roi;
  var todayRoi;
  var levelincome;
  var directincome;
  var rewardincome;
  var royaltyincome;
  var totalamount;
  var netamount;
  var todayIncome;
  var workingCurrentBalance;
  var nonWorkingCurrentBalance;
  var activationEWalletBalance;
  String? address;
  String? mObile;
  String? email;
  var investAmount;
  var maximumReward;
  String? sponsorDetail;
  String? sponsorid;
  String? sponsorname;
  String? sponsorMobile;
  String? packageName;
  var packagePV;
  var myInvestment;
  String? isbooster;
  var workingCurrentBalanceUsdt;
  var nonWorkingCurrentBalanceUsdt;
  var activationEWalletBalanceUsdt;
  String? isBooster1;
  String? memberstatus;
  var downlineBusiness;
  var totremain;
  var totCappingremain;
  var totWithdrawal;
  var isTotalEarned;
  var todayDownlineBusiness;
  var totalSelfBusiness;
  var directCount;
  var downlineTeamCount;
  String? downlineActTeamCount;
  String? downlineDActTeamCount;
  var countryid;

  Dashboard(
      {this.memberId,
        this.memberName,
        this.whatsappSupport,
        this.dOJ,
        this.withdrawalWalletAddress,
        this.otherwalletaddress,
        this.dOA,
        this.directCountActiveTeam,
        this.directCountDeactiveTeam,
        this.refferlink,
        this.isTrading,
        this.isFinance,
        this.isRealEstate,
        this.isECommerce,
        this.accountNumber,
        this.iFSCCode,
        this.roi,
        this.todayRoi,
        this.levelincome,
        this.directincome,
        this.rewardincome,
        this.royaltyincome,
        this.totalamount,
        this.netamount,
        this.todayIncome,
        this.workingCurrentBalance,
        this.nonWorkingCurrentBalance,
        this.activationEWalletBalance,
        this.address,
        this.mObile,
        this.email,
        this.investAmount,
        this.maximumReward,
        this.sponsorDetail,
        this.sponsorid,
        this.sponsorname,
        this.sponsorMobile,
        this.packageName,
        this.packagePV,
        this.myInvestment,
        this.isbooster,
        this.workingCurrentBalanceUsdt,
        this.nonWorkingCurrentBalanceUsdt,
        this.activationEWalletBalanceUsdt,
        this.isBooster1,
        this.memberstatus,
        this.downlineBusiness,
        this.totremain,
        this.totCappingremain,
        this.totWithdrawal,
        this.isTotalEarned,
        this.todayDownlineBusiness,
        this.totalSelfBusiness,
        this.directCount,
        this.downlineTeamCount,
        this.downlineActTeamCount,
        this.downlineDActTeamCount,
        this.countryid});

  Dashboard.fromJson(Map<String, dynamic> json) {
    memberId = json['MemberId'];
    memberName = json['MemberName'];
    whatsappSupport = json['whatsappSupport'];
    dOJ = json['DOJ'];
    withdrawalWalletAddress = json['withdrawal_wallet_address'];
    otherwalletaddress = json['otherwalletaddress'];
    dOA = json['DOA'];
    directCountActiveTeam = json['DirectCountActiveTeam'];
    directCountDeactiveTeam = json['DirectCountDeactiveTeam'];
    refferlink = json['refferlink'];
    isTrading = json['isTrading'];
    isFinance = json['isFinance'];
    isRealEstate = json['isRealEstate'];
    isECommerce = json['isECommerce'];
    accountNumber = json['AccountNumber'];
    iFSCCode = json['IFSCCode'];
    roi = json['roi'];
    todayRoi = json['today_roi'];
    levelincome = json['levelincome'];
    directincome = json['directincome'];
    rewardincome = json['rewardincome'];
    royaltyincome = json['royaltyincome'];
    totalamount = json['totalamount'];
    netamount = json['netamount'];
    todayIncome = json['todayIncome'];
    workingCurrentBalance = json['WorkingCurrentBalance'];
    nonWorkingCurrentBalance = json['NonWorkingCurrentBalance'];
    activationEWalletBalance = json['activationEWalletBalance'];
    address = json['Address'];
    mObile = json['MObile'];
    email = json['Email'];
    investAmount = json['InvestAmount'];
    maximumReward = json['maximumReward'];
    sponsorDetail = json['SponsorDetail'];
    sponsorid = json['Sponsorid'];
    sponsorname = json['Sponsorname'];
    sponsorMobile = json['SponsorMobile'];
    packageName = json['PackageName'];
    packagePV = json['PackagePV'];
    myInvestment = json['MyInvestment'];
    isbooster = json['isbooster'];
    workingCurrentBalanceUsdt = json['WorkingCurrentBalance_usdt'];
    nonWorkingCurrentBalanceUsdt = json['NonWorkingCurrentBalance_usdt'];
    activationEWalletBalanceUsdt = json['activationEWalletBalance_usdt'];
    isBooster1 = json['isBooster1'];
    memberstatus = json['memberstatus'];
    downlineBusiness = json['DownlineBusiness'];
    totremain = json['totremain'];
    totCappingremain = json['totCappingremain'];
    totWithdrawal = json['totWithdrawal'];
    isTotalEarned = json['IsTotalEarned'];
    todayDownlineBusiness = json['TodayDownlineBusiness'];
    totalSelfBusiness = json['totalSelfBusiness'];
    directCount = json['directCount'];
    downlineTeamCount = json['DownlineTeamCount'];
    downlineActTeamCount = json['DownlineActTeamCount'];
    downlineDActTeamCount = json['DownlineDActTeamCount'];
    countryid = json['countryid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MemberId'] = this.memberId;
    data['MemberName'] = this.memberName;
    data['whatsappSupport'] = this.whatsappSupport;
    data['DOJ'] = this.dOJ;
    data['withdrawal_wallet_address'] = this.withdrawalWalletAddress;
    data['otherwalletaddress'] = this.otherwalletaddress;
    data['DOA'] = this.dOA;
    data['DirectCountActiveTeam'] = this.directCountActiveTeam;
    data['DirectCountDeactiveTeam'] = this.directCountDeactiveTeam;
    data['refferlink'] = this.refferlink;
    data['isTrading'] = this.isTrading;
    data['isFinance'] = this.isFinance;
    data['isRealEstate'] = this.isRealEstate;
    data['isECommerce'] = this.isECommerce;
    data['AccountNumber'] = this.accountNumber;
    data['IFSCCode'] = this.iFSCCode;
    data['roi'] = this.roi;
    data['today_roi'] = this.todayRoi;
    data['levelincome'] = this.levelincome;
    data['directincome'] = this.directincome;
    data['rewardincome'] = this.rewardincome;
    data['royaltyincome'] = this.royaltyincome;
    data['totalamount'] = this.totalamount;
    data['netamount'] = this.netamount;
    data['todayIncome'] = this.todayIncome;
    data['WorkingCurrentBalance'] = this.workingCurrentBalance;
    data['NonWorkingCurrentBalance'] = this.nonWorkingCurrentBalance;
    data['activationEWalletBalance'] = this.activationEWalletBalance;
    data['Address'] = this.address;
    data['MObile'] = this.mObile;
    data['Email'] = this.email;
    data['InvestAmount'] = this.investAmount;
    data['maximumReward'] = this.maximumReward;
    data['SponsorDetail'] = this.sponsorDetail;
    data['Sponsorid'] = this.sponsorid;
    data['Sponsorname'] = this.sponsorname;
    data['SponsorMobile'] = this.sponsorMobile;
    data['PackageName'] = this.packageName;
    data['PackagePV'] = this.packagePV;
    data['MyInvestment'] = this.myInvestment;
    data['isbooster'] = this.isbooster;
    data['WorkingCurrentBalance_usdt'] = this.workingCurrentBalanceUsdt;
    data['NonWorkingCurrentBalance_usdt'] = this.nonWorkingCurrentBalanceUsdt;
    data['activationEWalletBalance_usdt'] = this.activationEWalletBalanceUsdt;
    data['isBooster1'] = this.isBooster1;
    data['memberstatus'] = this.memberstatus;
    data['DownlineBusiness'] = this.downlineBusiness;
    data['totremain'] = this.totremain;
    data['totCappingremain'] = this.totCappingremain;
    data['totWithdrawal'] = this.totWithdrawal;
    data['IsTotalEarned'] = this.isTotalEarned;
    data['TodayDownlineBusiness'] = this.todayDownlineBusiness;
    data['totalSelfBusiness'] = this.totalSelfBusiness;
    data['directCount'] = this.directCount;
    data['DownlineTeamCount'] = this.downlineTeamCount;
    data['DownlineActTeamCount'] = this.downlineActTeamCount;
    data['DownlineDActTeamCount'] = this.downlineDActTeamCount;
    data['countryid'] = this.countryid;
    return data;
  }
}