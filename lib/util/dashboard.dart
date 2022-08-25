import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pib_project/pages/accountpage.dart';
import 'package:pib_project/pages/homepage.dart';
import 'package:pib_project/pages/newsDetail.dart';
import 'package:pib_project/pages/profilepage.dart';
import '../pages/searchpage.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Bottom Navigation Bar',
      home: DashBoard(),
    ),
  );
}

class DashBoard extends StatefulWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard> {
  var currentIndex = 0;
  late int _selectedIndex = 0;

  @override
  void initState() {
    checkUserLoggedIn();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * .01),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .32
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? displayWidth * .12 : 0,
                    width: index == currentIndex ? displayWidth * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? Colors.blueAccent.withOpacity(.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .31
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .13 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == currentIndex
                                  ? '${listOfStrings[index]}'
                                  : '',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .03 : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .076,
                            color: index == currentIndex
                                ? Colors.blueAccent
                                : Colors.black26,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    NewsDetail(
        index: 0,
        type:
            "https://syndication.twitter.com/srv/timeline-profile/screen-name/PIBFactCheck?dnt=false&embedId=twitter-widget-2&frame=false&lang=en&origin=https%3A%2F%2Fmib.gov.in%2F&sessionId=2aa9c03d50b71c24ddc9c2ea78c4c89975cfe8d6&showHeader=true&showReplies=false&widgetsVersion=31f0cdc1eaa0f%3A1660602114609"),
    ProfilePage(),
  ];

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.account_balance_rounded,
    Icons.fact_check_outlined,
    Icons.person_rounded,
  ];

  List<String> listOfStrings = [
    'Home',
    'Ministry',
    'Fact\nCheck',
    'Account',
  ];
}
