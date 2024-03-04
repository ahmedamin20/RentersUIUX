import 'package:flutter/material.dart';
import 'package:ksb/core/resource/colors_manager.dart';

import '../resource/text_style_manager.dart';

abstract class AppTheme {
  static final light = ThemeData(
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(color: ColorsManager.blue),
        iconTheme: IconThemeData(color: ColorsManager.grayDark),
        color: ColorsManager.white,
        elevation: 0),

    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(ColorsManager.primaryColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color: ColorsManager.white),
      ),

    ),
    scaffoldBackgroundColor: ColorsManager.white,
    fontFamily: "Urbanist",
  );
  static final dark = ThemeData(
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(color: ColorsManager.blue),
        iconTheme: IconThemeData(color: ColorsManager.grayDark),
        color: ColorsManager.primaryColor,
        elevation: 0),
    scaffoldBackgroundColor: ColorsManager.blackColor,

    fontFamily: "Urbanist",
  );

}
