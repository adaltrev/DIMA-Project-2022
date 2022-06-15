import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension CustomStyles on TextTheme {
  //text for watching card title
  TextStyle get cardText1 =>
      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w400);
  //Text for watching card info
  TextStyle get cardText2 =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w300);
  //CardItem for watching and wishlist title
  TextStyle get cardText3 =>
      TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w400);
  //CardItem for watching and wishlist subtitle
  TextStyle get cardText4 =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300);
  //text for the modal sheet
  TextStyle get modalSheetText => TextStyle(fontSize: 16.sp);

  TextStyle get modalSheetTextBig =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400);

  TextStyle get seasonPagesLabel =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400);

  TextStyle get tabBarLabel => TextStyle(fontSize: 15.sp);
}
