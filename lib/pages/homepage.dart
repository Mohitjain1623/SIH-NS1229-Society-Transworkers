import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pib_project/pages/bookletdetailpage.dart';
import 'package:pib_project/pages/imagepage.dart';
import 'package:pib_project/pages/topnews.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import '../util/showimage.dart';
import '../util/staticDB.dart';
import 'newsDetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Images",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.roboto().fontFamily)),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePage()));
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Show All",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              fontFamily: GoogleFonts.roboto().fontFamily)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Stack(children: <Widget>[
                CarouselSlider.builder(
                  itemCount: StaticDB.images['images'].length,
                  options: CarouselOptions(
                    height: 200,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => NewsDetail(index: index)));
                        showFullImage(index);
                      },
                      child: Container(
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(20)),
                        // elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Hero(
                            //   tag: StaticDB.news['news'][index]['id'],
                            //   child: Image.asset(
                            //       'assets/aazadi-ka-mahotsav.png',
                            //       height: MediaQuery.of(context)
                            //               .size
                            //               .height *
                            //           0.05,),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Hero(
                                tag: index,
                                child: Image.network(
                                  StaticDB.images['images'][index]['imageURL'],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              child: Stack(children: <Widget>[
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 15),
                    itemCount: StaticDB.releaseAug.keys.length,
                    itemBuilder: (context, index) {
                      return Column(children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                StaticDB.releaseAug.keys.elementAt(index),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w600,
                                    fontFamily:
                                        GoogleFonts.roboto().fontFamily)),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                          child: Stack(children: <Widget>[
                            ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(left: 15),
                                itemCount: StaticDB
                                            .releaseAug[StaticDB.releaseAug.keys
                                                .elementAt(index)]
                                            .length >
                                        5
                                    ? 5
                                    : StaticDB
                                        .releaseAug[StaticDB.releaseAug.keys
                                            .elementAt(index)]
                                        .length,
                                itemBuilder: (context, int index2) {
                                  return index2 < 4
                                      ? InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NewsDetail(
                                                          index: index2,
                                                          type: StaticDB
                                                              .releaseAug.keys
                                                              .elementAt(index),
                                                        )));
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.15,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              elevation: 5,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  // Hero(
                                                  //   tag: StaticDB.news['news'][index]['id'],
                                                  //   child: Image.asset(
                                                  //       'assets/aazadi-ka-mahotsav.png',
                                                  //       height: MediaQuery.of(context)
                                                  //               .size
                                                  //               .height *
                                                  //           0.05,),
                                                  // ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      StaticDB.releaseAug[StaticDB
                                                              .releaseAug.keys
                                                              .elementAt(index)]
                                                          [index2]['title'],
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .roboto()
                                                                  .fontFamily),
                                                    ),
                                                  ),
                                                  Divider(),
                                                  Text(
                                                    StaticDB.releaseAug[StaticDB
                                                            .releaseAug.keys
                                                            .elementAt(index)]
                                                        [index2]['date'],
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontFamily:
                                                            GoogleFonts.roboto()
                                                                .fontFamily),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.45,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              elevation: 5,
                                              child: InkWell(
                                                onTap: () {
                                                  // start();
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              TopNews(
                                                                type: StaticDB
                                                                    .releaseAug
                                                                    .keys
                                                                    .elementAt(
                                                                        index),
                                                              )));
                                                },
                                                child: Center(
                                                  child: Text(
                                                    "Show All",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontFamily:
                                                            GoogleFonts.roboto()
                                                                .fontFamily),
                                                  ),
                                                ),
                                              )));
                                })
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                      ]);
                    })
              ]),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(23, 8, 8, 8),
                child: Text("Booklet",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.roboto().fontFamily)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
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
                                  launch(StaticDB.Booklet["Booklet"][index]
                                      ['bookletURL']);
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    elevation: 5,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: Image.asset(
                                            "assets/ebook.png",
                                            height: MediaQuery.of(context).size.height *
                                                0.06,
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
                                                fontFamily: GoogleFonts.roboto()
                                                    .fontFamily),
                                          ),
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    elevation: 5,
                                    child: InkWell(
                                      onTap: () {
                                        // start();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BookletDetailPage()));
                                      },
                                      child: Center(
                                        child: Text(
                                          "Show All",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: GoogleFonts.roboto()
                                                  .fontFamily),
                                        ),
                                      ),
                                    )));
                      })
                ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
          ]),
        ),
      ),
    );
  }

  void showFullImage(int index) async {
    double _scale = 1.0;
    double _previousScale = 0;
    int currentIndex = index;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          var url = StaticDB.images["images"][index]["imageURL"];

          return Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: SizedBox(
              height: double.infinity,
              // height: MediaQuery.of(context).size.height / 1.2,
              width: double.infinity,
              // width: MediaQuery.of(context).size.width / 1.1,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: GestureDetector(
                              onScaleStart: (ScaleStartDetails details) {
                                _previousScale = _scale;
                                setState(() {});
                              },
                              onScaleUpdate: (ScaleUpdateDetails details) {
                                setState(() =>
                                    _scale = _previousScale * details.scale);
                              },
                              onScaleEnd: (ScaleEndDetails details) {
                                _previousScale = 0;
                                setState(() {});
                              },
                              child: Transform(
                                transform: Matrix4.diagonal3(
                                    vector.Vector3(_scale, _scale, _scale)),
                                alignment: FractionalOffset.center,
                                child: Hero(
                                  tag: currentIndex,
                                  child: ImageUtil(
                                    src: url,
                                    fitSize: BoxFit.contain,
                                    progressColor: Colors.blue,
                                    height: 0,
                                    width: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white60,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.redAccent,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _scale = 1.0;
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white60,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Icon(
                                      Icons.refresh_outlined,
                                      color: Colors.redAccent,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  StaticDB.images.length <= 1
                      ? Container()
                      : Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              if (currentIndex != 0) {
                                currentIndex = currentIndex - 1;
                                setState(() {});
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                  StaticDB.images.length <= 1
                      ? Container()
                      : Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              if (currentIndex != StaticDB.images.length - 1) {
                                currentIndex = currentIndex + 1;
                                setState(() {});
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
