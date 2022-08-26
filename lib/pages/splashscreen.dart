import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pib_project/pages/loginpage.dart';
import 'package:pib_project/routes.dart';
import 'package:pib_project/util/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

checkUserLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('isLoggedIn') == true) {
    return true;
  } else {
    return false;
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserLoggedIn().then((value) {
      if (value) {
        Future.delayed(
            Duration(seconds: 3),
                () =>
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashBoard()),
                )
        );
      } else {
        Future.delayed(
            Duration(seconds: 3),
                () =>
                Navigator.pushReplacementNamed(
                  context,
                  MyRoutes.loginRoute,
                ));
      }
    });
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.3,
              ),
              Image.asset('assets/pib-logo.png', width: 200, height: 200),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.3,
              ),
              // Image.asset(
              //     'assets/aazadi-ka-mahotsav.png', width: 80, height: 80),
              Text('Press Information Bureau',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts
                          .roboto()
                          .fontFamily)),
            ],
          ),
        ),
      );
    }
  }
