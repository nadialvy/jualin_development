// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/pref_helper.dart';
import 'color.dart';
import 'typography.dart';

///   created               : Aditya Pratama
///   originalFilename      : app_themes
///   date                  : May 2022
///   —————————————————————————————————————————————————————————————————————————————
///   feature:
///   - light mode
///   - dark mode
///

mixin AppThemes {
  // —————————————————————————————————————————————————————————————————————————————
  // light
  // —————————————————————————————————————————————————————————————————————————————
  static final light = ThemeData(
    // Coloring
    primaryColor: colorPrimary,
    primaryColorDark: colorPrimaryDark,
    primaryColorLight: colorPrimaryLight,
    primaryIconTheme: IconThemeData(color: colorNeutral),
    colorScheme: const ColorScheme.light(primary: colorPrimary).copyWith(secondary: colorAccent),
    errorColor: colorError,
    backgroundColor: colorWhite,
    scaffoldBackgroundColor: colorWhite,
    dividerColor: colorNeutral[200],

    // ListTile
    listTileTheme: ListTileThemeData(
      textColor: colorBlack,
      minLeadingWidth: 16,
      contentPadding: EdgeInsets.all(0),
    ),

    // FAB
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: colorPrimary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontWeight: FontWeight.w700),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: TextStyle(fontWeight: FontWeight.w600),
      ),
    ),

    // AppBar
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: colorBlack),
      color: Colors.white,
      elevation: 0.5,
      centerTitle: false,
      titleTextStyle: TextStyle(color: colorBlack, fontFamily: 'InterSans'),
      actionsIconTheme: IconThemeData(color: Colors.grey),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),

    // Text
    textTheme: GoogleFonts.interTextTheme(GreduTypography.lightTextTheme),
    snackBarTheme: const SnackBarThemeData(backgroundColor: colorPrimaryLight),

    // Icon
    iconTheme: const IconThemeData(color: colorPrimary),
    popupMenuTheme: const PopupMenuThemeData(color: colorNeutralLight),

    // InputDecoration
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 14, color: colorBlack),
      hintStyle: TextStyle(fontSize: 14, color: colorNeutral[300]),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    ),

    // Card
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colorNeutral[150]!),
        borderRadius: BorderRadius.circular(4),
      ),
    ),

    // Chip
    chipTheme: ChipThemeData.fromDefaults(
      secondaryColor: colorSuccess[50]!,
      labelStyle: TextStyle(color: colorSuccess, fontSize: 12),
      primaryColor: colorSuccess,
    ),

    tabBarTheme: TabBarTheme(
      labelColor: colorPrimary,
      unselectedLabelColor: colorNeutral,
      indicator: UnderlineTabIndicator(borderSide: BorderSide(color: colorPrimary)),
    ),
  );

  // —————————————————————————————————————————————————————————————————————————————
  // dark
  // —————————————————————————————————————————————————————————————————————————————
  static final dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: colorPrimary,
    primaryColorDark: colorPrimaryDark,
    primaryColorLight: colorPrimaryLight,
    primaryIconTheme: IconThemeData(color: colorNeutral),
    colorScheme: ColorScheme.dark(primary: colorNeutral[500]!).copyWith(secondary: colorAccent),
    errorColor: colorError,
    backgroundColor: colorNeutral[900],
    cardColor: colorWhite,
    scaffoldBackgroundColor: colorNeutral[900],
    disabledColor: colorNeutral[100],
    hintColor: colorNeutral[300],
    dividerColor: colorNeutral[200],
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorPrimary[800],
    ),
    listTileTheme: ListTileThemeData(
      textColor: colorWhite,
      minLeadingWidth: 16,
    ),
    appBarTheme: AppBarTheme(
      color: colorNeutral[500],
      iconTheme: IconThemeData(color: colorWhite),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(color: colorWhite, fontWeight: FontWeight.bold),
      toolbarTextStyle: TextStyle(color: colorWhite),
      centerTitle: false,
      actionsIconTheme: IconThemeData(color: colorWhite),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: colorPrimary,
      textTheme: ButtonTextTheme.accent,
      colorScheme: ColorScheme.highContrastDark(),
    ),
    cardTheme: CardTheme(
      color: colorNeutralDark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => colorAccent),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) => TextStyle(color: colorWhite)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) => TextStyle(color: colorWhite)),
      ),
    ),
    snackBarTheme: SnackBarThemeData(backgroundColor: colorBlack),
    iconTheme: IconThemeData(color: colorWhite),
    popupMenuTheme: PopupMenuThemeData(color: colorNeutral[900]),
    textTheme: GoogleFonts.interTextTheme(GreduTypography.darkTextTheme),
  );

  // —————————————————————————————————————————————————————————————————————————————
  // config
  // —————————————————————————————————————————————————————————————————————————————
  static ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  static bool _loadThemeFromBox() => PrefHelper.isDarkMode ?? false;

  static Future<void> _saveThemeToBox(bool isDarkMode) async => PrefHelper.setIsDarkMode(isDarkMode);

  static void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
