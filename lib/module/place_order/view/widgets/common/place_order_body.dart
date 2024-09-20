import 'package:flutter/material.dart';
import 'package:sunrise_cafe/module/place_order/view/widgets/order_cart_widget.dart';
import 'package:sunrise_cafe/module/place_order/view/widgets/order_history_widget.dart';

class PlaceOrderBody extends StatelessWidget {
  const PlaceOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            OrderCartWidget(),
            SizedBox(
              height: 16,
            ),
            OrderHistoryWidget()
          ],
        ),
      ),
    );
  }
}
