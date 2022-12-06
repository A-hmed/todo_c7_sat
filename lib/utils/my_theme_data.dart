import 'package:flutter/material.dart';

class MyThemeData {
  static Color primirayColor = Color(0xff5D9CEC);
  static Color accentColor = Color(0xffDFECDB);
  static Color colorGrey = Color(0xffC8C9CB);
  static Color primirayColorDark = Color(0xff5D9CEC);
  static Color accentColorDark = Color(0xff060E1E);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: accentColor,
    primaryColor: primirayColor,
    accentColor: accentColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: primirayColor,
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primirayColor,
      unselectedItemColor: colorGrey,
      showSelectedLabels: false,
      showUnselectedLabels: false
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.bold, color: primirayColor, fontSize: 18),
        titleSmall: TextStyle(fontWeight: FontWeight.normal, color: Colors.black54, fontSize: 12),
      displayMedium: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
      displaySmall: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffA9A9A9), fontSize: 18)
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
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primirayColor
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