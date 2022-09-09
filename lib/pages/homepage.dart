import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

// import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pib_project/pages/bookletdetailpage.dart';
import 'package:pib_project/pages/imagepage.dart';
import 'package:pib_project/pages/topnews.dart';
import 'package:pib_project/routes.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../util/showimage.dart';
import '../util/staticDB.dart';
import 'newsDetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> arr = [];
bool interestAvailable = false;
int language = 0;
bool loading = true;
String rssFeed = "";

checkUserInterest() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('isInterested') == true) {
    arr = prefs.getStringList('interest')!;
    // print(arr);
    interestAvailable = true;
    return true;
  } else {
    interestAvailable = false;
    return false;
  }
}

checkUserLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('isLangSelected') == true) {
    language = prefs.getInt('language')!;

    return true;
  } else {
    language = 0;
    return false;
  }
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;
  get controller => null;

  // SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
  @override
  void initState() {
    final Controller controller = Controller()
      ..addListener((event) {
        // _handleCallbackEvent(event.direction, event.success);
      });
    checkUserInterest().then((value) {
      setState(() {});
    });
    checkUserLanguage().then((value) {
      setState(() {});
    });
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);
    PageController _searchPageController = PageController();
    // final provider = Provider.of<FeedProvider>(context, listen: false);
    // provider.setfeedPageController(_pageController);
    int lastPage = 0;

    return Scaffold(
      appBar: AppBar(
        actions: [
          isSearching
              ? IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                this.isSearching = false;
                // filteredCountries = countries;
              });
            },
          )
              : IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                this.isSearching = true;
              });
            },
          )

        ],
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.pushNamed(context, MyRoutes.notificationRoute);
        //       },
        //       icon: Icon(
        //         Icons.notifications_none_rounded,
        //         color: Colors.grey,
        //       ))
        // ],
        backgroundColor: Colors.blue[100],
        // centerTitle: true,
        // title: Row(
        //   children: [
        //     // SizedBox(
        //     //   width: 20,
        //     // ),
        //     // Container(
        //     //   height: 38,
        //     //   width: MediaQuery.of(context).size.width * 0.75,
        //     //   decoration: BoxDecoration(
        //     //     borderRadius: BorderRadius.circular(25),
        //     //     color: Colors.grey[300],
        //     //   ),
        //     //   child: Row(
        //     //     children: [
        //     //       Padding(
        //     //         padding: const EdgeInsets.all(8.0),
        //     //         child: Icon(
        //     //           Icons.search,
        //     //           size: 20,
        //     //           color: Colors.black,
        //     //         ),
        //     //       ),
        //     //       Expanded(
        //     //         child: TextFormField(
        //     //           cursorColor: Colors.black,
        //     //           focusNode: searchFocusNode,
        //     //           controller: searchController,
        //     //           decoration: InputDecoration(
        //     //             border: InputBorder.none,
        //     //             hintText: 'Search',
        //     //             hintStyle: TextStyle(
        //     //               fontSize: 17,
        //     //               color: Colors.black45,
        //     //               fontFamily: GoogleFonts.roboto().fontFamily,
        //     //             ),
        //     //           ),
        //     //           style: TextStyle(
        //     //             fontSize: 17,
        //     //             color: Colors.black,
        //     //             fontFamily: GoogleFonts.roboto().fontFamily,
        //     //           ),
        //     //           onChanged: (value) {
        //     //             setState(() {
        //     //               searchController.text = value;
        //     //               searchController.selection =
        //     //                   TextSelection.fromPosition(TextPosition(
        //     //                       offset: searchController.text.length));
        //     //             });
        //     //           },
        //     //         ),
        //     //       ),
        //     //       IconButton(
        //     //         onPressed: () {
        //     //           searchController.clear();
        //     //           searchController.text = '';
        //     //           setState(() {});
        //     //         },
        //     //         icon: !searchController.text.isEmpty
        //     //             ? Icon(
        //     //                 Icons.cancel,
        //     //                 color: Colors.black,
        //     //               )
        //     //             : Icon(
        //     //                 Icons.cancel,
        //     //                 color: Colors.black45,
        //     //               ),
        //     //       ),
        //     //     ],
        //     //   ),
        //     // ),
        //   ],
        // ),
        // Divider(
        //   color: Colors.grey[300],
        //   thickness: 1,
        // ),
        title: !isSearching
            ? Text('Press Information Bureau',style: TextStyle(color: Colors.grey),)
            : TextField(
          onChanged: (value) {
            // _filterCountries(value);
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.white)),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: PageView(
          onPageChanged: (page) {
            // if (page >=
            //     StaticDB.pressRelease['rss']['channel'][language]['item']
            //         .length) {
            //   provider.setSearchAppBarVisible(false);
            //   provider.setAppBarVisible(false);
            // } else {
            //   provider.setSearchAppBarVisible(true);
            //   provider.setAppBarVisible(true);
            // }
            // lastPage = page;
            // provider.setCurentArticalIndex(page);
            // provider.setFeedBottomActionbarVisible(false);
          },
          controller: _pageController,
          children: [
            PageView.builder(
              itemCount: StaticDB
                  .pressRelease['rss']['channel'][language]['item'].length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsDetail(
                                    index: index,
                                    type: StaticDB.pressRelease['rss']
                                        ['channel'][language]['language'],
                                  )));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(30.0),
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: MediaQuery.of(context).size.width * 0.9,
                        // color: Colors.white,
                        child:
                        // Consumer<FeedProvider>(
                        //   builder: (context, value, child) {
                        //     return
                              Center(
                              child: Column(
                                children: [
                                  Image.asset('assets/aazadi-ka-mahotsav.png',
                                      width: 250, height: 250),
                                  Divider(height: 5, thickness: 2),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      StaticDB.pressRelease['rss']['channel']
                                          [language]['item'][index]['title'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            GoogleFonts.roboto().fontFamily,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: Colors.blueAccent,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NewsDetail(
                                                          index: index,
                                                          type: StaticDB.pressRelease[
                                                                          'rss']
                                                                      ['channel']
                                                                  [language]
                                                              ['language'],
                                                        )));
                                          },
                                          icon: Icon(
                                            Icons.open_in_new,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.17,
                                      ),
                                      Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: Colors.blueAccent,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            shareProduct(
                                                StaticDB.pressRelease['rss']
                                                        ['channel'][language]
                                                    ['item'][index]['link']);
                                            setState(() {});
                                          },
                                          icon: Icon(
                                            Icons.share,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                        //   }
                        // )
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      //   ),
    );
  }

  void shareProduct(String url) {
    Share.share(
        "Press Information Bureau released new Article, Checkout now: ${url}");
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
