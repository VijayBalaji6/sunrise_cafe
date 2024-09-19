// CartNotifier for managing the cart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunrise_cafe/module/cafe_home/model/cafe_item_model.dart';
import 'package:sunrise_cafe/module/place_order/model/user_order_model.dart';

class UserCartNotifier extends StateNotifier<List<OrderedItemData>> {
  UserCartNotifier() : super([]);

  void addItem(CafeItemModel item) {
    state = [
      for (final cartItem in state)
        if (cartItem.cafeItemData == item)
          cartItem.copyWith(itemCount: cartItem.itemCount + 1)
        else
          cartItem,
      if (state.where((element) => element.cafeItemData == item).isEmpty)
        OrderedItemData(cafeItemData: item, itemCount: 1),
    ];
  }

  void removeItem(CafeItemModel item) {
    state = [
      for (final cartItem in state)
        if (cartItem.cafeItemData == item && cartItem.itemCount > 1)
          cartItem.copyWith(itemCount: cartItem.itemCount - 1)
        else if (cartItem.cafeItemData != item)
          cartItem,
    ];
  }

  bool isInCart(CafeItemModel cafeItem) {
    return state
        .any((item) => item.cafeItemData.productId == cafeItem.productId);
  }

  int getItemCount(CafeItemModel cafeItem) {
    return state
        .firstWhere((item) => item.cafeItemData.productId == cafeItem.productId,
            orElse: () => OrderedItemData(cafeItemData: cafeItem, itemCount: 0))
        .itemCount;
  }

  void clearCart() {
    state = [];
  }
}

final userCartProvider =
    StateNotifierProvider<UserCartNotifier, List<OrderedItemData>>((ref) {
  return UserCartNotifier();
});
