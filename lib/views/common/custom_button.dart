import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/exports.dart';
import 'exports.dart';
import 'reusable_text.dart';

Widget appButtonRegText({
  required String text,
  double height = 50,
  required BuildContext context,
  void Function()? func,
}) {
  double width = 350.w;

  return GestureDetector(
    onTap: func,
    child: Container(
      width: width,
      height: height,
      decoration: appBoxDecorationGradient(),
      child: Center(child: subHeading(text: text)),
    ),
  );
}

Widget textBtnLight(
    {required String text,
    double fontSize = 14,
    void Function()? func,
    BuildContext? context}) {
  return GestureDetector(
    onTap: func,
    child: Text(
      text,
      style: TextStyle(
        color: ColorConstants.textPrimary,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        fontFamily: "Lato",
      ),
    ),
  );
}

Widget textBtn(
    {required String text,
    double fontSize = 14,
    void Function()? func,
    BuildContext? context}) {
  return GestureDetector(
    onTap: func,
    child: Text(
      text,
      style: TextStyle(
        color: ColorConstants.textSecondary,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        fontFamily: "Lato",
      ),
    ),
  );
}
