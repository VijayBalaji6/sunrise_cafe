import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunrise_cafe/common/widgets/add_to_cart_button.dart';
import 'package:sunrise_cafe/module/cafe_home/model/cafe_item_model.dart';
import 'package:sunrise_cafe/module/place_order/view_model/user_order_provider.dart';

class SpecialItemCard extends ConsumerWidget {
  final CafeItemModel cafeItemData;

  const SpecialItemCard({
    super.key,
    required this.cafeItemData,
  });
  final Offset distance = const Offset(28, 28);
  final double blur = 30.0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(userCartProvider);
    final cartNotifier = ref.read(userCartProvider.notifier);

    bool isInCart = cartNotifier.isInCart(cafeItemData);
    int itemCount = cartNotifier.getItemCount(cafeItemData);
    return Neumorphic(
      style: NeumorphicStyle(
          color: const Color(0xFFF6F6F6),
          depth: -5.0,
          intensity: .8,
          disableDepth: false,
          surfaceIntensity: .4,
          shadowDarkColor: const Color(0xFFFFFFFF),
          shadowLightColor: const Color(0xFFCDCDCD),
          boxShape: NeumorphicBoxShape.roundRect(
              const BorderRadius.all(Radius.circular(15))),
          shape: NeumorphicShape.convex,
          lightSource:
              LightSource.lerp(LightSource.right, LightSource.bottomLeft, .9)!),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            cafeItemData.itemImage,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cafeItemData.itemName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹ ${cafeItemData.itemPrice}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AddToCartButton(
                      isAlreadyIn: isInCart,
                      itemCount: itemCount,
                      addAction: () => ref
                          .read(userCartProvider.notifier)
                          .addItem(cafeItemData),
                      removeAction: () => ref
                          .read(userCartProvider.notifier)
                          .removeItem(cafeItemData),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
