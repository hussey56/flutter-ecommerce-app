import 'package:ecom3/utils/theme/custom_themes/appbar_theme.dart';
import 'package:ecom3/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ecom3/utils/theme/custom_themes/chip_theme.dart';
import 'package:ecom3/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ecom3/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:ecom3/utils/theme/custom_themes/text_from_field_theme.dart';
import 'package:ecom3/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class HAppTheme {
  HAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: HTextTheme.lightTextTheme,
      elevatedButtonTheme: HElevatedButtonTheme.lightElevatedButtonTheme,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      bottomSheetTheme: HBottomSheettheme.lightBottomSheetTheme,
      chipTheme: HChipTheme.lightChipTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: HTextFormField.lightInputDecorationTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: HTextTheme.darkTextTheme,
      elevatedButtonTheme: HElevatedButtonTheme.darkElevatedButtonTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: HBottomSheettheme.darkBottomSheetTheme,
      chipTheme: HChipTheme.darkChipTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: HTextFormField.darkInputDecorationTheme);
}
