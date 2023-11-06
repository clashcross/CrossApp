import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        subtitle1: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          height: 1.3,
        ),
      ),
      primaryTextTheme: TextTheme(
        bodyText1: const TextStyle(color: Colors.black, fontSize: 15),
        bodyText2: const TextStyle(color: Colors.black54, fontSize: 15),
        subtitle1: const TextStyle(color: Colors.black),
        headline3: const TextStyle(
            color: Colors.black, fontSize: 27, fontWeight: FontWeight.bold),
        headline6: const TextStyle(color: Colors.black),
        caption: TextStyle(
            color: Colors.grey.shade700, wordSpacing: -1, fontSize: 12),

      ),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(primary: Colors.blue),
      primaryColor: Colors.green,
      iconTheme: const IconThemeData(color: Colors.blue,opacity: 0.8),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey  ,
        elevation: 20,
        backgroundColor:Colors.white,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,

        ),

      ),

      fontFamily: 'jannah',
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(

      scaffoldBackgroundColor: Colors.grey.shade900,
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        subtitle1: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 1.3,
        ),
      ),
      primaryTextTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white, fontSize: 15),
          bodyText2: TextStyle(color: Colors.white70, fontSize: 15),
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
          headline6: TextStyle(color: Colors.white),
          caption:
          TextStyle(color: Colors.white54, wordSpacing: -1, fontSize: 12)),
      colorScheme: const ColorScheme.dark(primary: Colors.blue),
      primaryColor: Colors.green,
      iconTheme: const IconThemeData(color: Colors.blue,opacity: 0.8),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        elevation: 20,
        backgroundColor: Colors.black12,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade900,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      fontFamily: 'jannah',

    );
  }
}