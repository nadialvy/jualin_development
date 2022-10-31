import 'package:flutter/material.dart';

import 'color.dart';

mixin GreduTypography {
  // LIGHT THEME TEXT
  static const TextTheme lightTextTheme = TextTheme(
    bodyText1: TextStyle(color: Color(0xFF000C17), fontSize: 16, height: 1.4),
    bodyText2: TextStyle(color: colorNeutral, fontSize: 14, height: 1.4),
    headline1: TextStyle(color: Color(0xFF000C17), fontSize: 18, height: 1.4, fontWeight: FontWeight.w700),
    headline2: TextStyle(color: Color(0xFF000C17), fontSize: 18, height: 1.4),
    caption: TextStyle(color: Color(0xFF7F8790), fontSize: 12, height: 1.4),
    overline: TextStyle(color: colorPrimary),
  );

  // DARK THEME TEXT
  static const TextTheme darkTextTheme = TextTheme(
    bodyText1: TextStyle(color: colorWhite, fontSize: 16, height: 1.4),
    bodyText2: TextStyle(color: colorWhite, fontSize: 14, height: 1.4),
    headline1: TextStyle(color: colorWhite, fontSize: 18, height: 1.4),
    headline2: TextStyle(color: colorWhite, fontSize: 18, height: 1.4),
    caption: TextStyle(color: colorWhite, fontSize: 12, height: 1.4),
    overline: TextStyle(color: colorWhite),
  );
}
