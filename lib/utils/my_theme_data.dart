import 'package:flutter/material.dart';

class MyThemeData {
  static Color primirayColor = Color(0xff5D9CEC);
  static Color accentColor = Color(0xffDFECDB);

  static Color primirayColorDark = Color(0xff5D9CEC);
  static Color accentColorDark = Color(0xff060E1E);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primirayColor,
    accentColor: accentColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: primirayColor,
      toolbarHeight: 100,
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primirayColor
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.bold, color: primirayColor, fontSize: 18),
        titleSmall: TextStyle(fontWeight: FontWeight.normal, color: Colors.black54, fontSize: 12)
    )
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: primirayColorDark,
      accentColor: accentColorDark,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: accentColorDark
      ),
      textTheme: TextTheme(
          titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
          titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
         bodySmall: TextStyle(color: accentColorDark, fontSize: 18, ),

      )
  );

}