class PurchaseReceiptModel {
  PurchaseReceiptModel({
    this.orderId,
    this.packageName,
    this.productId,
    this.purchaseTime,
    this.purchaseState,
    this.purchaseToken,
    this.quantity,
    this.autoRenewing,
    this.acknowledged,
  });

  final String? orderId;
  final String? packageName;
  final String? productId;
  final int? purchaseTime;
  final int? purchaseState;
  final String? purchaseToken;
  final int? quantity;
  final bool? autoRenewing;
  final bool? acknowledged;

  PurchaseReceiptModel copyWith({
    String? orderId,
    String? packageName,
    String? productId,
    int? purchaseTime,
    int? purchaseState,
    String? purchaseToken,
    int? quantity,
    bool? autoRenewing,
    bool? acknowledged,
  }) {
    return PurchaseReceiptModel(
      orderId: orderId ?? this.orderId,
      packageName: packageName ?? this.packageName,
      productId: productId ?? this.productId,
      purchaseTime: purchaseTime ?? this.purchaseTime,
      purchaseState: purchaseState ?? this.purchaseState,
      purchaseToken: purchaseToken ?? this.purchaseToken,
      quantity: quantity ?? this.quantity,
      autoRenewing: autoRenewing ?? this.autoRenewing,
      acknowledged: acknowledged ?? this.acknowledged,
    );
  }

  factory PurchaseReceiptModel.fromJson(Map<String, dynamic> json){
    return PurchaseReceiptModel(
      orderId: json["orderId"],
      packageName: json["packageName"],
      productId: json["productId"],
      purchaseTime: json["purchaseTime"],
      purchaseState: json["purchaseState"],
      purchaseToken: json["purchaseToken"],
      quantity: json["quantity"],
      autoRenewing: json["autoRenewing"],
      acknowledged: json["acknowledged"],
    );
  }

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "packageName": packageName,
    "productId": productId,
    "purchaseTime": purchaseTime,
    "purchaseState": purchaseState,
    "purchaseToken": purchaseToken,
    "quantity": quantity,
    "autoRenewing": autoRenewing,
    "acknowledged": acknowledged,
  };

  @override
  String toString(){
    return "$orderId, $packageName, $productId, $purchaseTime, $purchaseState, $purchaseToken, $quantity, $autoRenewing, $acknowledged, ";
  }



}

/*
{
	"orderId": "GPA.3312-3494-0395-39504",
	"packageName": "com.ksb.kidsstorybooks",
	"productId": "tale_treats_weekly",
	"purchaseTime": 1706763344153,
	"purchaseState": 0,
	"purchaseToken": "manpkfbefiogmebbcopaphcj.AO-J1OyHVkmeklF-te0BoBBw_VEagTofC9zCw0nufKiog4n0TG75LYmmqUjQMzshyEIz42kXHcS96kRzUlvd1QRsvMOIJNl_sASxe7EcQYrW6vgO52i5tfE",
	"quantity": 1,
	"autoRenewing": true,
	"acknowledged": false
}*/