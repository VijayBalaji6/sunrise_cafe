import 'package:flutter/material.dart';
import 'package:sunrise_cafe/module/cafe_home/view/screens/home_main_menu.dart';
import 'package:sunrise_cafe/module/cafe_home/view/screens/home_special_menu.dart';

class CafeHomTabBar extends StatelessWidget {
  const CafeHomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.teal,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.teal,
            tabs: [
              Tab(text: 'Special'),
              Tab(text: 'Main'),
              Tab(text: 'Desserts'),
              Tab(text: 'Beverages'),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: const TabBarView(
                children: [
                  HomeSpecialMenu(),
                  HomeMainMenu(),
                  HomeSpecialMenu(),
                  HomeMainMenu(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
