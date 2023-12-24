import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/exports.dart';

// Heading, text size: 24.sp
// parameter: gradient, bold
// default: white color normal text
Widget heading({
  required String text,
  bool isGradient = false,
  bool isBold = false,
}) {
  return ShaderMask(
    shaderCallback: (bounds) => isGradient
        ? linearGradientPTB.createShader(bounds)
        : const LinearGradient(
            colors: [ColorConstants.textPrimary, ColorConstants.textPrimary],
          ).createShader(bounds),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        // The color must be set to white for this to work
        color: isGradient ? Colors.white : ColorConstants.textPrimary,
        fontSize: 24.sp,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontFamily: "Lato",
      ),
    ),
  );
}

// SubHeading, text size: 20.sp
// parameter: gradient, bold
Widget subHeading({
  required String text,
  bool isGradient = false,
  bool isBold = false,
}) {
  return ShaderMask(
    shaderCallback: (bounds) => isGradient
        ? linearGradientPTB.createShader(bounds)
        : const LinearGradient(
            colors: [ColorConstants.textPrimary, ColorConstants.textPrimary],
          ).createShader(bounds),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        // The color must be set to white for this to work
        color: isGradient ? Colors.white : ColorConstants.textPrimary,
        fontSize: 20.sp,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontFamily: "Lato",
      ),
    ),
  );
}

// Title, text size: 18.sp
// parameter: gradient, bold
// default: white color normal text
Widget title({
  required String text,
  bool isGradient = false,
  bool isBold = false,
}) {
  return ShaderMask(
    shaderCallback: (bounds) => isGradient
        ? linearGradientPTB.createShader(bounds)
        : const LinearGradient(
            colors: [ColorConstants.textPrimary, ColorConstants.textPrimary],
          ).createShader(bounds),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        // The color must be set to white for this to work
        color: isGradient ? Colors.white : ColorConstants.textPrimary,
        fontSize: 18.sp,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontFamily: "Lato",
      ),
    ),
  );
}

// SubTitle, text size: 16.sp
// parameter: gradient, bold
// default: grey color normal text
Widget subTitle(
    {required String text,
    bool isGradient = false,
    bool isBold = false,
    bool isAlignLeft = true}) {
  return ShaderMask(
    shaderCallback: (bounds) => isGradient
        ? linearGradientPTB.createShader(bounds)
        : const LinearGradient(
            colors: [ColorConstants.textPrimary, ColorConstants.textSecondary],
          ).createShader(bounds),
    child: Text(
      text,
      textAlign: isAlignLeft ? TextAlign.left : TextAlign.right,
      style: TextStyle(
        // The color must be set to white for this to work
        color: isGradient ? Colors.white : ColorConstants.textSecondary,
        fontSize: 16.sp,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontFamily: "Lato",
      ),
    ),
  );
}

// SubTitle, text size: 14.sp
// default: grey color normal text
Widget hintText({
  required String text,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      // The color must be set to white for this to work
      color: ColorConstants.textSecondary,
      fontSize: 14.sp,
      fontFamily: "Lato",
    ),
  );
}

// Heading for text inside box widgets
Widget boxHeading(
    {required String text,
    Color color = ColorConstants.textPrimary,
    TextAlign textAlign = TextAlign.center,
    bool isBold = false}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: "Lato",
    ),
  );
}

// Small heading for each section in Aayats app
Widget dividerHeading({required String text}) {
  return Padding(
    padding: EdgeInsets.all(8.w),
    child: Container(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: ColorConstants.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: "Lato",
        ),
      ),
    ),
  );
}

// Main style text for contents in Aayats app
Widget mainText({
  required String text,
  bool isBold = false,
  bool isHint = false,
  bool isAlignLeft = false,
}) {
  return Text(
    text,
    textAlign: isAlignLeft ? TextAlign.left : TextAlign.center,
    style: TextStyle(
        // The color must be set to white for this to work
        color: ColorConstants.textPrimary,
        fontSize: isHint ? 10.sp : 14.sp,
        fontFamily: "Lato",
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
  );
}
