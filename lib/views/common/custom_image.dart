import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/exports.dart';

Widget appImage({
  String imagePath = ImageRes.defaultImg,
  double width = 24,
  double height = 24,
}) {
  return Image.asset(
    imagePath.isEmpty ? ImageRes.defaultImg : imagePath,
    width: width.w,
    height: height.h,
  );
}

Widget appImageWithColor({
  String imagePath = ImageRes.defaultImg,
  Color color = ColorConstants.accentTertiary,
  double width = 24,
  double height = 24,
}) {
  return Image.asset(
    imagePath.isEmpty ? ImageRes.defaultImg : imagePath,
    width: width.w,
    height: height.h,
    color: color,
  );
}
