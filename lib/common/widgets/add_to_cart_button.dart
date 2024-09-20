import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
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
    return NeumorphicButton(
      style: NeumorphicStyle(
          color: const Color(0xFFF6F6F6),
          depth: 15.0,
          intensity: 0.1,
          disableDepth: true,
          oppositeShadowLightSource: true,
          surfaceIntensity: .1,
          shadowDarkColor: const Color(0xFFCDCDCD),
          shadowLightColor: const Color(0xFFFFFFFF),
          boxShape: NeumorphicBoxShape.roundRect(
              const BorderRadius.all(Radius.circular(15))),
          shape: NeumorphicShape.concave,
          lightSource: LightSource.lerp(
              LightSource.bottomRight, LightSource.topLeft, .1)!),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: !isAlreadyIn
            ? [
                generateNeomorphsButton(
                  buttonAction: addAction!,
                  buttonName: Icons.add,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'ADD',
                  style: TextStyle(fontSize: 14),
                ),
              ]
            : [
                generateNeomorphsButton(
                  buttonAction: removeAction!,
                  buttonName: Icons.remove,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  itemCount.toString(),
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  width: 10,
                ),
                generateNeomorphsButton(
                  buttonAction: addAction!,
                  buttonName: Icons.add,
                ),
              ],
      ),
    );
  }

  Widget generateNeomorphsButton(
      {required void Function() buttonAction, required IconData buttonName}) {
    return NeumorphicButton(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      onPressed: buttonAction,
      style: const NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(),
          shape: NeumorphicShape.concave,
          depth: -5),
      child: Icon(
        buttonName,
        color: AppColor.tealColor,
        size: 20,
      ),
    );
  }
}
