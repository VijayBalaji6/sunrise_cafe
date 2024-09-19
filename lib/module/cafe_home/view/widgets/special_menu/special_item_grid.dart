import 'package:flutter/material.dart';
import 'package:sunrise_cafe/common/constants/app_constants.dart';
import 'package:sunrise_cafe/module/cafe_home/view/widgets/special_menu/special_item_card.dart';

class SpecialItemsGrid extends StatelessWidget {
  const SpecialItemsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.75,
      ),
      itemCount: specialItems.length,
      itemBuilder: (context, index) {
        final item = specialItems[index];
        return SpecialItemCard(
          cafeItemData: item,
        );
      },
    );
  }
}
