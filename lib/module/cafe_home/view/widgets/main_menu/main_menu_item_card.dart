import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunrise_cafe/common/widgets/add_to_cart_button.dart';
import 'package:sunrise_cafe/common/widgets/custom_bordered_icon.dart';
import 'package:sunrise_cafe/module/cafe_home/model/cafe_item_model.dart';
import 'package:sunrise_cafe/module/place_order/view_model/user_order_provider.dart';

class MainMenuItemCard extends ConsumerWidget {
  final CafeItemModel cafeItemData;

  const MainMenuItemCard({super.key, required this.cafeItemData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(userCartProvider);
    final cartProvider = ref.watch(userCartProvider.notifier);
    bool isInCart = cartProvider.isInCart(cafeItemData);
    int itemCount = cartProvider.getItemCount(cafeItemData);
    return Neumorphic(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      style: NeumorphicStyle(
          color: const Color(0xFFF6F6F6),
          depth: 15.0,
          intensity: .9,
          surfaceIntensity: .1,
          shadowDarkColor: const Color(0xFFFFFFFF),
          shadowLightColor: const Color(0xFFCDCDCD),
          boxShape: NeumorphicBoxShape.roundRect(
              const BorderRadius.all(Radius.circular(15))),
          shape: NeumorphicShape.convex,
          lightSource:
              LightSource.lerp(LightSource.bottom, LightSource.top, .9)!),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              cafeItemData.itemImage,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cafeItemData.itemName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CustomBorderedIcon(
                            height: 20,
                            width: 20,
                            customBorderedIconName: 'assets/home/veg.svg'),
                        const SizedBox(width: 8),
                        Text(
                          "₹ ${cafeItemData.itemPrice}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
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
