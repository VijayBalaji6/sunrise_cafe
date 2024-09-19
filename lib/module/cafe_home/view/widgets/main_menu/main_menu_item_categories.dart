import 'package:flutter/material.dart';
import 'package:sunrise_cafe/common/constants/app_constants.dart';
import 'package:sunrise_cafe/common/widgets/custom_expansion_tile.dart';
import 'package:sunrise_cafe/common/widgets/expansion_menu_title_widget.dart';
import 'package:sunrise_cafe/module/cafe_home/view/widgets/main_menu/main_menu_item_card.dart';

class MainMenuItemCategories extends StatelessWidget {
  const MainMenuItemCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: mainMenuItemCategories.length,
        itemBuilder: (BuildContext context, int index) {
          final categoryItem = mainMenuItemCategories[index];
          return CustomExpansionTile(
            titleWidget: ExpanderMenuTitleWidget(
              title: categoryItem.categoryName,
            ),
            childWidget: [
              ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: categoryItem.categoryItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MainMenuItemCard(
                      cafeItemData: categoryItem.categoryItems[index],
                    );
                  }),
            ],
          );
        });
  }
}
