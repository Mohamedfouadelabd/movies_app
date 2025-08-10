

import 'package:flutter/material.dart';

class MyTheme{
  static const Color primaryColor=Color(0xff121312);
static const Color white= Color(0xffFFFFFF);
  static const Color darkGray= Color(0xff707070);
  static const Color yellow= Color(0xffFFBB3B);
static ThemeData PrimaryTheme=ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
  elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedItemColor: MyTheme.darkGray,
    selectedItemColor: MyTheme.yellow,
  ),
scaffoldBackgroundColor: MyTheme.primaryColor,
textTheme: TextTheme(
  titleSmall:TextStyle(
fontWeight: FontWeight.bold,
   fontSize: 11,
color: white

  ) ,
  titleMedium: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: white,
  ),
  titleLarge:TextStyle(
    fontSize: 20,
    color: white,
    fontWeight: FontWeight.bold
  ) ,
bodySmall: TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w700,
color: white
),

),
);


}