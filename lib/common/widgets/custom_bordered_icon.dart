// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CustomBorderedIcon extends StatelessWidget {
  const CustomBorderedIcon({
    super.key,
    required this.customBorderedIconName,
    this.height,
    this.width,
    this.tapAction,
  });
  final String customBorderedIconName;
  final double? height;
  final double? width;
  final void Function()? tapAction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapAction,
      child: SvgPicture.asset(
        customBorderedIconName,
        height: height ?? 50,
        width: width ?? 50,
      ),
    );
  }
}
