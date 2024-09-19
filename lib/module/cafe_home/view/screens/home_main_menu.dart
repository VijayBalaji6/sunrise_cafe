import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sunrise_cafe/module/cafe_home/view/widgets/main_menu/main_menu_item_categories.dart';

class HomeMainMenu extends StatelessWidget {
  const HomeMainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: MainMenuItemCategories(),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset('assets/home/main_menu/menu.svg'))
      ],
    );
  }
}
