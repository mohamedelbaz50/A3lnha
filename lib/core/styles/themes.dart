import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    primaryColor: HexColor("#1159a4"),
    fontFamily: "Cairo",
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   showUnselectedLabels: true,
    //   backgroundColor: Colors.white,
    //   selectedItemColor: HexColor("#1159a4"),
    //   unselectedItemColor: Colors.grey,
    //   selectedLabelStyle: TextStyle(
    //     fontFamily: "Cairo",
    //     fontSize: 14.sp,
    //     fontWeight: FontWeight.w800,
    //   ),
    //   unselectedLabelStyle: TextStyle(
    //     fontFamily: "Cairo",
    //     fontSize: 12.sp,
    //     fontWeight: FontWeight.w600,
    //   ),
    // ),
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.black),
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: "Cairo",
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      elevation: 0,
      centerTitle: true,
    ),
  );
}
