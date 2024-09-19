import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunrise_cafe/module/place_order/view_model/previous_order_provider.dart';
import 'package:sunrise_cafe/module/place_order/view_model/user_order_provider.dart';

class PlaceOrderBottomBar extends ConsumerWidget {
  const PlaceOrderBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(userCartProvider);
    final orderHistoryProvider = ref.read(previousOrderProvider.notifier);
    final isCartItemsEmpty = cartItems.isEmpty;
    return GestureDetector(
      onTap: isCartItemsEmpty
          ? () => Navigator.of(context).pop()
          : () {
              orderHistoryProvider.addItem(cartItems);
              ref.watch(userCartProvider.notifier).clearCart();
            },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF459EAF),
                  Color(0xFF007991),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: isCartItemsEmpty
                  ? MainAxisAlignment.spaceAround
                  : MainAxisAlignment.spaceBetween,
              children: isCartItemsEmpty
                  ? [
                      const Text(
                        'Go Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ]
                  : [
                      Text(
                        '${cartItems.length} Items',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Row(
                        children: [
                          Text(
                            'PLACE ORDER',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundColor: Color(0xFF007991),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
            )),
      ),
    );
  }
}
