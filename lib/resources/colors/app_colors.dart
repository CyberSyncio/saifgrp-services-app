import 'package:flutter/material.dart';

class AppColor {
  static const Color blackColor = Color(0xff000000);
  static const Color whiteColor = Color.fromARGB(255, 255, 255, 255);
  static const Color g1 = Color(0xffE5B2CA);
  static const Color g2 = Color(0xffCD82DE);
  static const Color kInputColor = Color(0xff3C3C43);
  static const Color kButtonColor = Color(0xff78258B);
  static const Color kWhiteColor = Colors.white;
  static Color kPrimaryColor = const Color(0xFF0081C9);
  static Color kPrimaryColorVariant = const Color(0xff686795);
  static Color kAccentColor = const Color(0xffFCAAAB);
  static Color kAccentColorVariant = const Color(0xffF7A3A2);
  static Color kUnreadChatBG = const Color(0xffEE1D1D);
  static Color kbackGroundColor = const Color(0xFF0081C9);
  static Color kdarkColor = const Color(0xFF242635);
  static Color kbuttonColor1 = const Color(0xFF3269F2);
  static Color kbuttonColor2 = const Color(0xFF79B2FD);
  static Color kgrey = Colors.black;
}

getShapeWidget(BuildContext context, double radius) {
  final width = MediaQuery.of(context).size.width;

  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(width * radius),
  );
}

getBorderRadiusWidget(BuildContext context, double radius) {
  final width = MediaQuery.of(context).size.width;

  return BorderRadius.circular(width * radius);
}
