import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunrise_cafe/common/widgets/custom_bordered_icon.dart';
import 'package:sunrise_cafe/common/widgets/custom_expansion_tile.dart';
import 'package:sunrise_cafe/common/widgets/expansion_menu_title_widget.dart';
import 'package:sunrise_cafe/module/cafe_home/model/cafe_item_model.dart';
import 'package:sunrise_cafe/module/place_order/model/user_order_model.dart';
import 'package:sunrise_cafe/module/place_order/view_model/previous_order_provider.dart';

class OrderHistoryWidget extends ConsumerWidget {
  const OrderHistoryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final previousOrderHistory = ref.watch(previousOrderProvider);
    return CustomExpansionTile(
      titleWidget: const ExpanderMenuTitleWidget(
        title: "Order History",
      ),
      childWidget: [
        if (previousOrderHistory.isNotEmpty) ...[
          Neumorphic(
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
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: previousOrderHistory.length,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              itemBuilder: (context, index) {
                final OrderedItemData currentOrderedItem =
                    previousOrderHistory[index];
                final CafeItemModel orderedItem =
                    currentOrderedItem.cafeItemData;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CustomBorderedIcon(
                              height: 20,
                              width: 20,
                              customBorderedIconName: 'assets/home/veg.svg'),
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
                                "₹ ${orderedItem.itemPrice}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        currentOrderedItem.itemCount.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),
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
        ] else
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "You have no order History",
              style: TextStyle(color: Colors.lightBlue),
            ),
          )
      ],
    );
  }
}
