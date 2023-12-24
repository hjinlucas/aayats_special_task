import 'package:flutter/material.dart';

class ColorConstants {
  //STANDARD COLORS BY AAYATS
  //BRAND COLORS
  static const brandPrimary = Color(0xFF3e79ff);
  static const brandSecondary = Color(0xFF25e986);
  static const brandTertiary = Color(0xFFad2df2);
  static const brandAlternate = Color(0xFF262d34);

  //ACCENT COLORS
  static const accentPrimary = Color(0x80004dff);
  static const accentSecondary = Color(0x8025e986);
  static const accentTertiary = Color(0x80ad2df2);
  static const accentAlternate = Color(0xcd262d34);

  //UTILITY COLORS
  static const textPrimary = Color(0xFFfbfcfc);
  static const textSecondary = Color(0xFF95a1ac);
  static const backgroundPrimary = Color(0xFF121212);
  static const backgroundSecondary = Color(0xFF1c1d1f);
}

// Linear Gradient Color: From left to right - Light Blue to Deep Blue
const linearGradientBlue = LinearGradient(
  begin: Alignment(0.84, -0.54),
  end: Alignment(-0.84, 0.54),
  colors: [
    Color(0xFF1565D6),
    Color(0xFF168CF5),
    Color(0xF2004FD4),
    Color(0xCC002A8D)
  ],
);

// Linear Gradient Color: From left to right - Purple to Blue
const linearGradientPTB = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.0, 0.33, 0.66, 1.0],
  colors: [
    Color(0xFFAD2DF2),
    Color(0xFF8714C6),
    Color(0xFF2E65E7),
    Color(0xFF1546BD)
  ],
);

// Linear Gradient Color: From left to right - Purple to Blue, with Opacity
final linearGradientPTBwithOpacity = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  stops: const [0.0, 0.33, 0.66, 1.0],
  colors: [
    const Color(0xffAD2DF2).withOpacity(0.2), // AD2DF2
    const Color(0xff8714C6).withOpacity(0.2), // 8714C6
    const Color(0xff2E65E7).withOpacity(0.2), // 2E65E7
    const Color(0xff1546BD).withOpacity(0.2), // 1546BD
  ],
);
