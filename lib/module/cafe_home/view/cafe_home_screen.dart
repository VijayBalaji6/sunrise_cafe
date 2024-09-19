import 'package:flutter/material.dart';
import 'package:sunrise_cafe/module/cafe_home/view/widgets/common/cafe_home_app_bar.dart';
import 'package:sunrise_cafe/module/cafe_home/view/widgets/common/cafe_home_bottom_nav_bar.dart';
import 'package:sunrise_cafe/module/cafe_home/view/widgets/common/cafe_home_tab_bar.dart';

class CafeHomeScreen extends StatelessWidget {
  const CafeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CafeHomeAppBar(),
      body: CafeHomTabBar(),
      bottomNavigationBar: CafeHomeBottomNavBar(),
    );
  }
}
