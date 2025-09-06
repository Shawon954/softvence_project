import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle regularTextStyle({
  double size = 14,
  required Color color,
  FontWeight? fontweight = FontWeight.w400,
}) {
  return TextStyle(
    fontSize: size.sp,
    color: color,
    fontWeight: fontweight,
    fontFamily: 'Oxygen',
  );
}

TextStyle mediumTextStyle({
  double size = 14,
  required Color color,
  FontWeight fontWeight = FontWeight.w500,
}) {
  return TextStyle(
    fontSize: size.sp,
    color: color,
    fontWeight: fontWeight,
    fontFamily: 'Oxygen',
  );
}

TextStyle boldTextStyle({
  double size = 14,
  required Color color,
  FontWeight? fontweight = FontWeight.bold,
}) {
  return TextStyle(
    fontSize: size.sp,
    color: color,
    fontWeight: fontweight,
    fontFamily: 'Oxygen',
  );
}
