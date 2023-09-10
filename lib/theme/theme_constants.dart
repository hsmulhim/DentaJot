import 'package:flutter/material.dart';

Map themeMap = {
  'light': ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xfff2fbfd),
    // textfield input decoration
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(
        //textfield input color
        color: Colors.white,
        backgroundColor: Color(0xff003253),
        //textfield input font
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      //textfield input icon
      prefixIconColor: Colors.grey[800],
      suffixIconColor: Colors.grey[800],
      //textfield input boarder
      border: OutlineInputBorder(
        borderSide: const BorderSide(
            color: Color(0xff003253), width: BorderSide.strokeAlignOutside),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    // page transition
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
  ),
//--------------- dark mode
  'dark': ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff003253),
  )
};
