import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunrise_cafe/common/widgets/add_to_cart_button.dart';
import 'package:sunrise_cafe/common/widgets/custom_bordered_icon.dart';
import 'package:sunrise_cafe/common/widgets/custom_expansion_tile.dart';
import 'package:sunrise_cafe/common/widgets/expansion_menu_title_widget.dart';
import 'package:sunrise_cafe/module/cafe_home/model/cafe_item_model.dart';
import 'package:sunrise_cafe/module/place_order/model/user_order_model.dart';
import 'package:sunrise_cafe/module/place_order/view_model/user_order_provider.dart';

class OrderCartWidget extends ConsumerWidget {
  const OrderCartWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCartData = ref.watch(userCartProvider);
    return CustomExpansionTile(
      titleWidget: const ExpanderMenuTitleWidget(
        title: "Current order",
      ),
      childWidget: [
        if (userCartData.isNotEmpty) ...[
          Neumorphic(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
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
                lightSource: LightSource.lerp(
                    LightSource.bottomRight, LightSource.topLeft, .9)!),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: userCartData.length,
                  itemBuilder: (context, index) {
                    final OrderedItemData currentOrderedItem =
                        userCartData[index];
                    final CafeItemModel orderedItem =
                        currentOrderedItem.cafeItemData;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const CustomBorderedIcon(
                                  height: 20,
                                  width: 20,
                                  customBorderedIconName:
                                      'assets/home/veg.svg'),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    orderedItem.itemName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "₹${orderedItem.itemPrice}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          AddToCartButton(
                            isAlreadyIn: true,
                            itemCount: currentOrderedItem.itemCount,
                            addAction: () => ref
                                .read(userCartProvider.notifier)
                                .addItem(orderedItem),
                            removeAction: () => ref
                                .read(userCartProvider.notifier)
                                .removeItem(orderedItem),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Add cooking instruction',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ] else
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Your cart is empty",
              style: TextStyle(color: Colors.lightBlue),
            ),
          )
      ],
    );
  }
}
