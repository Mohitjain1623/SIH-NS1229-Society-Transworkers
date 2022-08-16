import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routes.dart';
import '../util/staticDB.dart';
import 'newsDetail.dart';

class TopNews extends StatefulWidget {
  final String type;

  const TopNews({Key? key, required this.type}) : super(key: key);

  @override
  State<TopNews> createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
  String type = "";

  @override
  void initState() {
    type = widget.type;
    super.initState();
  }

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
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(type,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: GoogleFonts.roboto().fontFamily)),
      ),
      backgroundColor: Colors.white,
      body: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.88,
          child: Stack(children: <Widget>[
            ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 15),
                itemCount: StaticDB.releaseAug[type].length,
                itemBuilder: (context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsDetail(
                                    index: index,
                                    type: type,
                                  )));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 15,
                        child: SingleChildScrollView(
                          child: Column(
                            verticalDirection: VerticalDirection.down,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container(
                              //   width: MediaQuery.of(context).size.width * 0.9,
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(20),
                              //       color: Colors.grey[200]),
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(8.0),
                              //     child: Hero(
                              //       tag: StaticDB.news['news'][index]['id'],
                              //       child: Image.asset(
                              //           'assets/aazadi-ka-mahotsav.png',
                              //           height:
                              //               MediaQuery.of(context).size.height * 0.1,),
                              //     ),
                              //   ),
                              // ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    StaticDB.releaseAug[type][index]['title'],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            GoogleFonts.roboto().fontFamily),
                                  ),
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  StaticDB.releaseAug[type][index]['date'],
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: GoogleFonts.roboto()
                                          .fontFamily),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Text(
                              //     StaticDB.news['news'][index]
                              //         ['subtitle'],
                              //     softWrap: true,
                              //     overflow: TextOverflow.ellipsis,
                              //     maxLines: 5,
                              //     style: TextStyle(
                              //         fontSize: 10,
                              //         fontFamily:
                              //             GoogleFonts.roboto().fontFamily),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ]),
        ),
      ]),
    );
  }
}
