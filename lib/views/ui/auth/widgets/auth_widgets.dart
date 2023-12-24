import 'package:aayats_mobile_app/views/common/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/exports.dart';
import '../../../common/exports.dart';

Widget thirdPartyLoginBtn(
    {required String imagePath, required BuildContext context}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
        width: 350.w,
        height: 50,
        margin: const EdgeInsets.only(top: 20),
        decoration: appBoxDecorationTextField(),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: SizedBox(
                  width: 30, // Set the width of the image
                  height: 30, // Set the height of the image
                  child: Image.asset(
                    imagePath,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: mainText(text: "Log In with Google"),
            ),
          ],
        )),
  );
}

// Text button for login & signup redirection
Widget textBtnHighlight(
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
        fontWeight: FontWeight.bold,
        fontFamily: "Lato",
      ),
    ),
  );
}

Widget authTitle({required String text, bool isGradient = false}) {
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
        fontSize: 36,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lato',
      ),
    ),
  );
}
