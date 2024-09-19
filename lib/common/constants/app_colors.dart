import 'package:flutter/material.dart';

class AppColor {
  static const Color tealColor = Color(0xff3cbcb4);
  static const Color vegGreenColor = Color(0xff5BAC81);

  static BoxDecoration neomorphsDecoration = BoxDecoration(
    color: const Color(0xFFF6F6F6),
    borderRadius: BorderRadius.circular(20.0),
    boxShadow: const [
      BoxShadow(
        color: Color(0xFFFFFFFF),
        offset: Offset(10, 10),
        blurRadius: 5.0,
      ),
      BoxShadow(
        color: Color(0xFFCDCDCD),
        offset: Offset(-10, -10),
        blurRadius: 5.0,
      ),
    ],
  );
  static BoxDecoration buttonNeomorphsDecoration = BoxDecoration(
    color: const Color(0xFFF6F6F6),
    borderRadius: BorderRadius.circular(20.0),
    boxShadow: const [
      BoxShadow(
        color: Color(0xFFFFFFFF),
        offset: Offset(0, 0),
        blurRadius: 5.0,
      ),
      BoxShadow(
        color: Color(0xFFCDCDCD),
        offset: Offset(3, 3),
        blurRadius: 5.0,
      ),
    ],
  );
}
