import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension CustomStyles on TextTheme {
  TextStyle get cardText1 =>
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400);

  TextStyle get cardText2 =>
      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w300);
}
