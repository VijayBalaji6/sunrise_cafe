import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunrise_cafe/common/widgets/custom_bordered_icon.dart';
import 'package:sunrise_cafe/module/place_order/view/place_order_screen.dart';
import 'package:sunrise_cafe/module/place_order/view_model/user_order_provider.dart';

class CafeHomeBottomNavBar extends StatelessWidget {
  const CafeHomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 55,
      elevation: 5,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            bottomNavIcon(iconName: "assets/bottom_app_bar/thunder.svg"),
            bottomNavIcon(iconName: "assets/bottom_app_bar/icon-home.svg"),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PlaceOrderScreen())),
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final userCartData = ref.watch(userCartProvider);
                  return Stack(
                    children: [
                      bottomNavIcon(
                          iconName: "assets/bottom_app_bar/shopping-bag.svg"),
                      if (userCartData.isNotEmpty)
                        Positioned(
                          right: 0,
                          top: -5,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 15,
                              minHeight: 15,
                            ),
                            child: Text(
                              userCartData
                                  .fold(
                                      0,
                                      (sum, userData) =>
                                          sum + userData.itemCount)
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Container bottomNavIcon({required String iconName}) {
  return Container(
    decoration: const BoxDecoration(
      shape: BoxShape.rectangle,
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.white, // Highlight for upper-left
          offset: Offset(-10, -10),
          blurRadius: 50,
          spreadRadius: 2,
        ),
        BoxShadow(
          color: Color(0xFFF1F1F1), // Shadow for bottom-right
          offset: Offset(10, 10),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
    ),
    child: CustomBorderedIcon(
        height: 40, width: 40, customBorderedIconName: iconName),
  );
}
