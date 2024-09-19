import 'package:sunrise_cafe/module/cafe_home/model/cafe_item_model.dart';

class OrderedItemData {
  CafeItemModel cafeItemData;
  int itemCount = 0;
  OrderedItemData({
    required this.cafeItemData,
    required this.itemCount,
  });

  OrderedItemData copyWith({CafeItemModel? cafeItemData, int? itemCount}) {
    return OrderedItemData(
      cafeItemData: cafeItemData ?? this.cafeItemData,
      itemCount: itemCount ?? this.itemCount,
    );
  }
}
