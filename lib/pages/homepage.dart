import 'dart:io';
import 'package:card_swiper/card_swiper.dart';
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
import 'package:progressive_image/progressive_image.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../util/showimage.dart';
import '../util/staticDB.dart';
import 'newsDetail.dart';
import 'dart:math' as math;

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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isSearching = false;

  // get controller => null;
  late AnimationController _controller;
  PageController controller = PageController();
  static dynamic currentPageValue = 0.0;

  // SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();

    controller.addListener(() {
      setState(() {
        currentPageValue = controller;
      });
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
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
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
              : Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          this.isSearching = true;
                        });
                      },
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, MyRoutes.notificationRoute);
                        },
                        icon: Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.grey,
                        ))
                  ],
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
            ? Text(
                'Press Information Bureau',
                style: TextStyle(color: Colors.grey),
              )
            : TextFormField(
                onChanged: (value) {
                  // _filterCountries(value);
                },
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child:
              // AnimatedBuilder(
              //   animation: _controller,
              //   // ^ registering our own function to listen to page changes
              //   builder: (BuildContext context, Widget? child) {
              //     return
              Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1), color: Colors.black),
        child: Swiper(
            viewportFraction: 1,
            scale: 0.7,
            fade: 0.5,
            loop: false,
            scrollDirection: Axis.vertical,
            itemCount: StaticDB.releaseAug.keys.length,
            // StaticDB.pressRelease['rss']['channel'][language]['item'].length,
            itemBuilder: (context, int index) {
              return Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsDetail(
                              index: index,
                              type: StaticDB.pressRelease['rss']['channel'][language]['language'],
                            )));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(30.0),
                      height: MediaQuery.of(context).size.height * 0.79,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () => {showFullImage(index)},
                                  child: ProgressiveImage(
                                    placeholder: AssetImage(
                                        'assets/aazadi-ka-mahotsav.png'),
                                    // size: 1.87KB
                                    thumbnail: NetworkImage(StaticDB
                                        .images["images"][index]["imageURL"]),
                                    // size: 1.29MB
                                    image: NetworkImage(StaticDB
                                        .images["images"][index]["imageURL"]),
                                    height: 200,
                                    width: 400,
                                  ),
                                  // Image.network(StaticDB.images["images"][index]["imageURL"],
                                  //     width: 400, height: 200),
                                ),
                                Divider(height: 5, thickness: 2),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    // StaticDB.releaseAug[StaticDB
                                    //     .releaseAug.keys
                                    //     .elementAt(index)]
                                    // [0]['title'],
                                    StaticDB.pressRelease['rss']['channel']
                                        [language]['item'][index]['title'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.roboto().fontFamily,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    StaticDB.releaseAug[StaticDB.releaseAug.keys
                                                .elementAt(index)][0]['date']
                                            .toString()
                                            .split(":")
                                            .last +
                                        "  |  " +
                                        StaticDB.releaseAug.keys
                                            .elementAt(index),
                                    // StaticDB.pressRelease['rss']['channel'][language]['item'][index]['title'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily:
                                          GoogleFonts.roboto().fontFamily,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Velit egestas dui id ornare arcu odio ut sem nulla. A diam sollicitudin tempor id eu nisl nunc mi ipsum. Aliquam vestibulum morbi blandit cursus risus at ultrices mi tempus. Adipiscing elit pellentesque habitant morbi tristique. Non enim praesent elementum facilisis. Nisi vitae suscipit tellus mauris a diam maecenas sed. Egestas diam in arcu cursus. Tincidunt nunc pulvinar sapien et ligula. Nisi vitae suscipit tellus mauris a diam maecenas sed. Phasellus egestas tellus rutrum tellus pellentesque eu. Sit amet aliquam id diam maecenas. Posuere morbi leo urna molestie at. Egestas maecenas pharetra convallis posuere morbi leo urna molestie at. Tristique et egestas quis ipsum suspendisse ultrices gravida.",
                                    // StaticDB.pressRelease['rss']['channel'][language]['item'][index]['title'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      fontFamily:
                                          GoogleFonts.roboto().fontFamily,
                                    ),
                                    maxLines: 7,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.blueAccent,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text('Coming Soon'),
                                        backgroundColor: Colors.green,
                                      ));
                                    },
                                    icon: Icon(
                                      Icons.volume_up_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.blueAccent,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text('Coming Soon'),
                                        backgroundColor: Colors.green,
                                      ));
                                    },
                                    icon: Icon(
                                      Icons.bookmark,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.blueAccent,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      shareProduct(StaticDB.pressRelease['rss']
                                              ['channel'][language]['item']
                                          [index]['link']);
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              );
            }),
      )
          //   },
          // )
          // AnimatedBuilder(
          //     animation: _controller,
          //     child: PageView(
          //       onPageChanged: (page) {
          //         setState(() => ({
          //           opacity = 2.0*opacity
          //         }));
          //       },
          //       controller: _pageController,
          //       children: [
          //         PageView.builder(
          //           itemCount: StaticDB
          //               .pressRelease['rss']['channel'][language]['item'].length,
          //           scrollDirection: Axis.vertical,
          //           itemBuilder: (BuildContext context, int index) {
          //             return Container(
          //               decoration: BoxDecoration(
          //                 color: Colors.white.withOpacity(opacity),
          //               ),
          //               child: Center(
          //                 child: InkWell(
          //                   onTap: () {
          //                     Navigator.push(
          //                         context,
          //                         MaterialPageRoute(
          //                             builder: (context) => NewsDetail(
          //                                   index: index,
          //                                   type: StaticDB.pressRelease['rss']
          //                                       ['channel'][language]['language'],
          //                                 )));
          //                   },
          //                   child: Container(
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(25),
          //                         color: Colors.white,
          //                       ),
          //                       padding: EdgeInsets.all(30.0),
          //                       height: MediaQuery.of(context).size.height * 0.75,
          //                       width: MediaQuery.of(context).size.width * 0.9,
          //                       // color: Colors.white,
          //                       child:
          //                           // Consumer<FeedProvider>(
          //                           //   builder: (context, value, child) {
          //                           //     return
          //                           Center(
          //                         child: Column(
          //                           children: [
          //                             Image.asset('assets/aazadi-ka-mahotsav.png',
          //                                 width: 250, height: 250),
          //                             Divider(height: 5, thickness: 2),
          //                             Padding(
          //                               padding: const EdgeInsets.only(top: 20.0),
          //                               child: Text(
          //                                 StaticDB.pressRelease['rss']['channel']
          //                                     [language]['item'][index]['title'],
          //                                 style: TextStyle(
          //                                   color: Colors.black,
          //                                   fontSize: 20,
          //                                   fontWeight: FontWeight.bold,
          //                                   fontFamily:
          //                                       GoogleFonts.roboto().fontFamily,
          //                                 ),
          //                               ),
          //                             ),
          //                             Row(
          //                               children: [
          //                                 Container(
          //                                   width: 100,
          //                                   decoration: BoxDecoration(
          //                                     borderRadius:
          //                                         BorderRadius.circular(25),
          //                                     color: Colors.blueAccent,
          //                                   ),
          //                                   child: IconButton(
          //                                     onPressed: () {
          //                                       Navigator.push(
          //                                           context,
          //                                           MaterialPageRoute(
          //                                               builder: (context) =>
          //                                                   NewsDetail(
          //                                                     index: index,
          //                                                     type: StaticDB.pressRelease[
          //                                                                     'rss']
          //                                                                 [
          //                                                                 'channel']
          //                                                             [language]
          //                                                         ['language'],
          //                                                   )));
          //                                     },
          //                                     icon: Icon(
          //                                       Icons.open_in_new,
          //                                       color: Colors.white,
          //                                     ),
          //                                   ),
          //                                 ),
          //                                 SizedBox(
          //                                   width: MediaQuery.of(context)
          //                                           .size
          //                                           .width *
          //                                       0.17,
          //                                 ),
          //                                 Container(
          //                                   width: 100,
          //                                   decoration: BoxDecoration(
          //                                     borderRadius:
          //                                         BorderRadius.circular(25),
          //                                     color: Colors.blueAccent,
          //                                   ),
          //                                   child: IconButton(
          //                                     onPressed: () {
          //                                       shareProduct(
          //                                           StaticDB.pressRelease['rss']
          //                                                   ['channel'][language]
          //                                               ['item'][index]['link']);
          //                                       setState(() {});
          //                                     },
          //                                     icon: Icon(
          //                                       Icons.share,
          //                                       color: Colors.white,
          //                                     ),
          //                                   ),
          //                                 )
          //                               ],
          //                             )
          //                           ],
          //                         ),
          //                       )
          //                       //   }
          //                       // )
          //                       ),
          //                 ),
          //               ),
          //             );
          //           },
          //         )
          //       ],
          //     ),
          //     builder: (BuildContext context, Widget? child) {
          //       return Transform.translate(
          //         offset: Offset(opacity, 0),
          //         child: child,
          //       );
          //     }),
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
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.89,
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
              ],
            ),
          );
        });
      },
    );
  }
}
