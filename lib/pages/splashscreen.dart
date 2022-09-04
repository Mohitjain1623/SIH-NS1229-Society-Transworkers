import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pib_project/pages/languagepage.dart';
import 'package:pib_project/routes.dart';
import 'package:pib_project/util/dashboard.dart';
import 'package:pib_project/util/staticDB.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import '../util/Constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<dynamic> rss = new List.filled(9, null, growable: false);

  checkUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> url = [
      'https://pib.gov.in/RssMain.aspx?ModId=6&Lang=1&Regid=3',
      'https://pib.gov.in/RssMain.aspx?ModId=6&Lang=16&Regid=5',
      'https://pib.gov.in/RssMain.aspx?ModId=8&Lang=11&Regid=6',
      'https://pib.gov.in/RssMain.aspx?ModId=6&Lang=6&Regid=17',
      'https://pib.gov.in/RssMain.aspx?ModId=6&Lang=4&Regid=19',
      'https://pib.gov.in/RssMain.aspx?ModId=6&Lang=8&Regid=20',
      'https://pib.gov.in/RssMain.aspx?ModId=6&Lang=13&Regid=22',
      'https://pib.gov.in/RssMain.aspx?ModId=6&Lang=10&Regid=23',
      'https://pib.gov.in/RssMain.aspx?ModId=6&Lang=15&Regid=24'
    ];
    for (int i = 0; i < url.length; i++) {
      main2(url[i], i);
    }

    if (prefs.getBool('isLoggedIn') == true) {
      return true;
    } else {
      return false;
    }
  }

  void main2(String url, int i) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Charset': 'utf-8',
    };
    var response = await http.get(Uri.parse(url), headers: headers);
    final prefix = 'ï»¿';
    var body = response.body;
    if (body.startsWith(prefix)) {
      body = body.substring(prefix.length);
    }
    // final responsebody = await json.decode(json.encode(body));
    final Xml2Json xml2Json = Xml2Json();
    xml2Json.parse(body);
    var jsonString = xml2Json.toParker();
    rss[i] = json.decode(jsonString);
    Constants.setRssFeed(
        true, rss, i, StaticDB.langImage['langImage'][i]['title']);
  }

  @override
  void initState() {
    super.initState();
    checkUserLoggedIn().then((value) {
      if (value) {
        Future.delayed(
            Duration(seconds: 3),
            () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashBoard()),
                ));
      } else {
        Future.delayed(
            Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LanguagePage(
                  start: true
                )))
            // Navigator.pushReplacementNamed(
            //   context,
            //   MyRoutes.loginRoute,
            // )
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
            ),
            // Image.asset('assets/pib-logo.png', width: 200, height: 200),
            Text('PRESS INFORMATION BUREAU',
                style: TextStyle(
                  color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.oswald().fontFamily)),
            Text('GOVERNMENT OF INDIA',
                style: TextStyle(
                  color: Colors.yellow,
                    fontSize: 22,
                    fontWeight:  FontWeight.normal,
                    fontFamily: GoogleFonts.oswald().fontFamily)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            // Image.asset(
            //     'assets/aazadi-ka-mahotsav.png', width: 80, height: 80),

          ],
        ),
      ),
    );
  }
}
