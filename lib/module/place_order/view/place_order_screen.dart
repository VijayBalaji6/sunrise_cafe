import 'package:flutter/material.dart';
import 'package:sunrise_cafe/module/place_order/view/widgets/common/place_order_app_bar.dart';
import 'package:sunrise_cafe/module/place_order/view/widgets/common/place_order_body.dart';
import 'package:sunrise_cafe/module/place_order/view/widgets/common/place_order_bottom_bar.dart';

class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: PlaceOderAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: PlaceOrderBottomBar(),
      body: PlaceOrderBody(),
    );
  }
}
