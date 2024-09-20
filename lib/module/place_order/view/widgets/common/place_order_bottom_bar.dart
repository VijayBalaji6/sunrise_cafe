import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                      Row(
                        children: [
                          const Text(
                            'PLACE ORDER',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Neumorphic(
                            padding: const EdgeInsets.symmetric(
                                vertical: 7, horizontal: 7),
                            style: NeumorphicStyle(
                                color: const Color(0xFF007991),
                                depth: -15.0,
                                intensity: .1,
                                disableDepth: true,
                                oppositeShadowLightSource: true,
                                surfaceIntensity: .9,
                                shadowDarkColor: const Color(0xFFFFFFFF),
                                shadowLightColor: const Color(0xFFFFFFFF),
                                boxShape: const NeumorphicBoxShape.circle(),
                                shape: NeumorphicShape.concave,
                                lightSource: LightSource.lerp(
                                    LightSource.bottomRight,
                                    LightSource.topLeft,
                                    1.1)!),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              weight: 4,
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
