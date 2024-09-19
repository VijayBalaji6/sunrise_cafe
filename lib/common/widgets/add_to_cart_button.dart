import 'package:flutter/material.dart';
import 'package:sunrise_cafe/common/constants/app_colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton(
      {super.key,
      required this.isAlreadyIn,
      this.addAction,
      this.removeAction,
      required this.itemCount});
  final bool isAlreadyIn;
  final void Function()? addAction;
  final void Function()? removeAction;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFFFFFFF),
            offset: Offset(-1, -1),
            blurRadius: 5.0,
          ),
          BoxShadow(
            color: Color(0xFFCDCDCD),
            offset: Offset(2, 2),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: isAlreadyIn
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.spaceBetween,
        children: !isAlreadyIn
            ? [
                IconButton(
                  onPressed: addAction,
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: AppColor.tealColor,
                  ),
                ),
                const Text(
                  'ADD',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  width: 10,
                ),
              ]
            : [
                IconButton(
                  onPressed: removeAction,
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: AppColor.tealColor,
                  ),
                ),
                Text(
                  itemCount.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  onPressed: addAction,
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: AppColor.tealColor,
                  ),
                ),
              ],
      ),
    );
  }
}
