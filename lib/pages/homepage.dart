import 'dart:io';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webfeed/webfeed.dart';
import '../routes.dart';
import '../util/staticDB.dart';
import 'newsDetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void start() async {
    final client = IOClient(HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true));

    var response = await client.get(Uri.parse(
        'https://www.pib.gov.in/RssMain.aspx?ModId=6&Lang=1&Regid=3.rss'));
    print(response);
    // var channel = RssFeed.parse(response.body);
    // print(channel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Press Information Bureau',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: GoogleFonts.roboto().fontFamily)),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Column(children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Top News",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.roboto().fontFamily)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Stack(children: <Widget>[
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 15),
                  itemCount: 5,
                  itemBuilder: (context, int index) {
                    return index < 4
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NewsDetail(index: index)));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Hero(
                                      tag: StaticDB.news['news'][index]['id'],
                                      child: Image.asset(
                                          'assets/aazadi-ka-mahotsav.png',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        StaticDB.data2['rss']["channel"]["item"][index]['title'],
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: GoogleFonts.roboto()
                                                .fontFamily),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 5,
                                child: InkWell(
                                  onTap: () {
                                    start();
                                    Navigator.pushNamed(
                                        context, MyRoutes.topnewsRoute);
                                  },
                                  child: Center(
                                    child: Text(
                                      "Show All",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily:
                                              GoogleFonts.roboto().fontFamily),
                                    ),
                                  ),
                                )));
                  })
            ]),
          ),
          SizedBox(
            height: 10,
          )
        ]),
      ),
    );
  }
}
