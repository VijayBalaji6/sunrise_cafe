import 'package:flutter/material.dart';
import 'package:sunrise_cafe/common/widgets/custom_bordered_icon.dart';

import '../../../../../common/constants/app_colors.dart';

class PlaceOderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PlaceOderAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      shape: Border.all(color: Colors.transparent, width: 0),
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: AppColor.buttonNeomorphsDecoration,
            child: const CustomBorderedIcon(
                customBorderedIconName: 'assets/place_order/back_icon.svg'),
          ),
        ),
      ),
      title: const Text(
        'Place Order',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: AppColor.buttonNeomorphsDecoration,
            child: const CustomBorderedIcon(
                customBorderedIconName: 'assets/place_order/chat_icon.svg'),
          ),
        )
      ],
    );
  }
}
