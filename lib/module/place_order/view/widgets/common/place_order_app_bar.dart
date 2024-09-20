import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class PlaceOderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PlaceOderAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 16),
        child: generateNeomorphsButton(
          buttonAction: () => Navigator.of(context).pop(),
          buttonName: const Icon(
            Icons.arrow_back,
            weight: 0.8,
            size: 25,
          ),
        ),
      ),
      centerTitle: false,
      title: const Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: Text(
          'Place Order',
          style: TextStyle(color: Colors.black),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0, bottom: 16),
          child: generateNeomorphsButton(
            buttonAction: () {},
            buttonName: const Icon(
              Icons.chat_sharp,
              size: 25,
              color: Color(0xFFF4B740),
            ),
          ),
        ),
      ],
    );
  }

  Widget generateNeomorphsButton(
      {required void Function() buttonAction, required Widget buttonName}) {
    return NeumorphicButton(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      onPressed: buttonAction,
      style: NeumorphicStyle(
        color: const Color(0xFFFFFFFF),
        shadowDarkColor: const Color(0xFFAEAEC0),
        shadowLightColor: const Color(0xFFFFFFFF),
        depth: 5.0,
        intensity: .5,
        oppositeShadowLightSource: true,
        lightSource: LightSource.lerp(
            LightSource.topLeft, LightSource.bottomRight, 1.2)!,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
        shape: NeumorphicShape.concave,
      ),
      child: buttonName,
    );
  }
}
