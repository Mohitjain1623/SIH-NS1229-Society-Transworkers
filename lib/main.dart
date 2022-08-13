import 'package:flutter/material.dart';
import 'package:pib_project/pages/accountpage.dart';
import 'package:pib_project/pages/homepage.dart';
import 'package:pib_project/pages/loginpage.dart';
import 'package:pib_project/pages/notificationpage.dart';
import 'package:pib_project/pages/searchpage.dart';
import 'package:pib_project/pages/signup.dart';
import 'package:pib_project/pages/splashscreen.dart';
import 'package:pib_project/routes.dart';
import 'package:pib_project/util/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: MyRoutes.splashRoute,
      routes: {
        // "/": (context) => SplashScreen(),
        MyRoutes.splashRoute: (context) => SplashScreen(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.signupRoute: (context) => SignUpPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.notificationRoute: (context) => NotificationPage(),
        MyRoutes.searchRoute: (context) => SearchPage(),
        MyRoutes.dashboardRoute: (context) => DashBoard(),
        MyRoutes.accountRoute: (context) => AccountPage(),
      },
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


