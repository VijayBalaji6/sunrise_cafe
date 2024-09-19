// CartNotifier for managing the cart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunrise_cafe/module/place_order/model/user_order_model.dart';

class PreviousOrderNotifier extends StateNotifier<List<OrderedItemData>> {
  PreviousOrderNotifier() : super([]);

  void addItem(List<OrderedItemData> item) {
    state = [...state, ...item];
  }
}

final previousOrderProvider =
    StateNotifierProvider<PreviousOrderNotifier, List<OrderedItemData>>((ref) {
  return PreviousOrderNotifier();
});
