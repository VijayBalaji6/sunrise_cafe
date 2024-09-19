import 'dart:convert';

class CafeItemModel {
  int productId;
  String itemName;
  String itemDescription;
  bool isVeg;
  String itemImage;
  double itemPrice;

  CafeItemModel({
    required this.productId,
    required this.itemName,
    required this.itemDescription,
    required this.isVeg,
    required this.itemImage,
    required this.itemPrice,
  });

  CafeItemModel copyWith({
    int? productId,
    String? itemName,
    String? itemDescription,
    bool? isVeg,
    String? itemImage,
    double? itemPrice,
  }) {
    return CafeItemModel(
      productId: productId ?? this.productId,
      itemName: itemName ?? this.itemName,
      itemDescription: itemDescription ?? this.itemDescription,
      isVeg: isVeg ?? this.isVeg,
      itemImage: itemImage ?? this.itemImage,
      itemPrice: itemPrice ?? this.itemPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'itemName': itemName,
      'itemDescription': itemDescription,
      'isVeg': isVeg,
      'itemImage': itemImage,
      'itemPrice': itemPrice,
    };
  }

  factory CafeItemModel.fromMap(Map<String, dynamic> map) {
    return CafeItemModel(
      productId: map['productId'] as int,
      itemName: map['itemName'] as String,
      itemDescription: map['itemDescription'] as String,
      isVeg: map['isVeg'] as bool,
      itemImage: map['itemImage'] as String,
      itemPrice: map['itemPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CafeItemModel.fromJson(String source) =>
      CafeItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
