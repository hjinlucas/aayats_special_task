import 'package:flutter/material.dart';

import '../../constants/exports.dart';

BoxDecoration appBoxShadow(
    {Color bgColor = ColorConstants.brandTertiary,
    double radius = 15.0,
    double sR = 1.0,
    double bR = 2.0}) {
  return BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: sR,
          blurRadius: bR,
          offset: const Offset(0, 1),
        )
      ]);
}

BoxDecoration appBoxDecorationGradient(
    {double radius = 15.0, double sR = 1.0, double bR = 2.0}) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.0, 0.33, 0.66, 1.0],
        colors: [
          Color(0xffAD2DF2), // AD2DF2
          Color(0xff8714C6), // 8714C6
          Color(0xff2E65E7), // 2E65E7
          Color(0xff1546BD), // 1546BD
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: sR,
          blurRadius: bR,
          offset: const Offset(0, 1),
        )
      ]);
}

class BannerBoxShadow extends StatelessWidget {
  final Widget child;

  const BannerBoxShadow({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[800]!
                .withOpacity(0.2), // Lighter shadow for visibility on black
            spreadRadius: 3, // Spread radius
            blurRadius: 6, // Blur radius
            offset: const Offset(
                2, 2), // Shadow position// Changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}

// BoxDecoration for text field
BoxDecoration appBoxDecorationTextField(
    {Color bgColor = ColorConstants.backgroundPrimary,
    double radius = 15.0,
    Color boarderColor = ColorConstants.textSecondary}) {
  return BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: boarderColor));
}
