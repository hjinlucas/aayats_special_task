import 'package:flutter/material.dart';

import '../../constants/exports.dart';

class AppTheme {
  static ThemeData appThemeData = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorConstants.backgroundSecondary),
    iconTheme: const IconThemeData(color: ColorConstants.textPrimary),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorConstants.backgroundSecondary,
      selectedItemColor:
          ColorConstants.accentTertiary, // Set the color for the selected item
      unselectedItemColor:
          ColorConstants.textSecondary, // Set the color for unselected items
    ),
  );
}
