import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../util/staticDB.dart';

class BookletDetailPage extends StatefulWidget {
  const BookletDetailPage({Key? key}) : super(key: key);

  @override
  _BookletDetailPageState createState() => _BookletDetailPageState();
}

class _BookletDetailPageState extends State<BookletDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text('Booklet',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              )),
        ),
        body: Column(children: <Widget>[
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.84,
              child: Stack(children: <Widget>[
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 15),
                    itemCount: StaticDB.Booklet["Booklet"].length,
                    itemBuilder: (context, int index) {
                      return InkWell(
                        onTap: () {
                          launch(
                              StaticDB.Booklet["Booklet"][index]['bookletURL']);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Image.asset(
                                    "assets/ebook.png",
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    StaticDB.Booklet["Booklet"][index]
                                        ['bookletTitle'],
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily:
                                            GoogleFonts.roboto().fontFamily),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
              ]),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ]));
  }
}
