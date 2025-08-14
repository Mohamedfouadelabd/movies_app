import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:movies_app/Browser/movies_discover_screen.dart';
import 'package:movies_app/Homescreen/home_screen.dart';
import 'package:movies_app/Homescreen/home_screen_detils.dart';
import 'package:movies_app/Main Screen/main_screen.dart';
import 'package:movies_app/Theme/my_theme.dart';

import 'Auth/Login/login_screen.dart';
import 'Auth/Register/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: MyTheme.PrimaryTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: LoginScreen.routeName,
          routes: {
            MainScreen.routeName: (context) => MainScreen(),
            HomeScreenDetils.routeName: (context) => HomeScreenDetils(),
            MovieDiscoverScreen.routeName: (context) => MovieDiscoverScreen(),
            RegisterScreen.routeName:(context) => RegisterScreen(),
            LoginScreen.routeName:(context) => LoginScreen(),
          },
        );
      },
    );
  }
}
