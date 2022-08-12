import 'package:flutter/material.dart';
import 'package:pib_project/pages/homepage.dart';
import 'package:pib_project/pages/loginpage.dart';
import 'package:pib_project/pages/signup.dart';
import 'package:pib_project/pages/splashscreen.dart';
import 'package:pib_project/routes.dart';

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
      },
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


