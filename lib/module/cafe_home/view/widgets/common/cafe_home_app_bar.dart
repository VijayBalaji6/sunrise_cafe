import 'package:flutter/material.dart';
import 'package:sunrise_cafe/common/widgets/custom_bordered_icon.dart';

class CafeHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CafeHomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[400],
            radius: 18,
          ),
          const SizedBox(width: 10),
          const Text(
            "Sunrise Cafe",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: const [
        CustomBorderedIcon(
          customBorderedIconName: 'assets/app_bar/icon-waiter.svg',
        ),
        CustomBorderedIcon(
          customBorderedIconName: 'assets/app_bar/icon-code.svg',
        ),
      ],
    );
  }
}
