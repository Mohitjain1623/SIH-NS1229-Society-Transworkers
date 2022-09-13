import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pib_project/pages/imagepage.dart';
import 'package:pib_project/pages/topnews.dart';
import 'package:pib_project/pages/videopage.dart';
import 'package:progressive_image/progressive_image.dart';

import '../routes.dart';
import '../util/staticDB.dart';
import 'newsDetail.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
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
          backgroundColor: Colors.blue[100],
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
          // Row(
          //   children: [
          //     // SizedBox(
          //     //   width: 20,
          //     // ),
          //     Container(
          //       height: 38,
          //       width: MediaQuery.of(context).size.width * 0.75,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(25),
          //         color: Colors.grey[300],
          //       ),
          //       child: Row(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Icon(
          //               Icons.search,
          //               size: 20,
          //               color: Colors.black,
          //             ),
          //           ),
          //           Expanded(
          //             child: TextFormField(
          //               cursorColor: Colors.black,
          //               focusNode: searchFocusNode,
          //               controller: searchController,
          //               decoration: InputDecoration(
          //                 border: InputBorder.none,
          //                 hintText: 'Search',
          //                 hintStyle: TextStyle(
          //                   fontSize: 17,
          //                   color: Colors.black45,
          //                   fontFamily: GoogleFonts.roboto().fontFamily,
          //                 ),
          //               ),
          //               style: TextStyle(
          //                 fontSize: 17,
          //                 color: Colors.black,
          //                 fontFamily: GoogleFonts.roboto().fontFamily,
          //               ),
          //               onChanged: (value) {
          //                 setState(() {
          //                   searchController.text = value;
          //                   searchController.selection =
          //                       TextSelection.fromPosition(TextPosition(
          //                           offset: searchController.text.length));
          //                 });
          //               },
          //             ),
          //           ),
          //           IconButton(
          //             onPressed: () {
          //               searchController.clear();
          //               searchController.text = '';
          //               setState(() {});
          //             },
          //             icon: !searchController.text.isEmpty
          //                 ? Icon(
          //                     Icons.cancel,
          //                     color: Colors.black,
          //                   )
          //                 : Icon(
          //                     Icons.cancel,
          //                     color: Colors.black45,
          //                   ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 5)),
              // Row(
              //   children: [
              //     SafeArea(
              //       top: true,
              //       child: Row(
              //         children: [
              //           SizedBox(
              //             width: 20,
              //           ),
              //           Container(
              //             height: 38,
              //             width: MediaQuery.of(context).size.width * 0.8,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(25),
              //               color: Colors.grey[300],
              //             ),
              //             child: Row(
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Icon(
              //                     Icons.search,
              //                     size: 20,
              //                     color: Colors.black,
              //                   ),
              //                 ),
              //                 Expanded(
              //                   child: TextFormField(
              //                     cursorColor: Colors.black,
              //                     focusNode: searchFocusNode,
              //                     controller: searchController,
              //                     decoration: InputDecoration(
              //                       border: InputBorder.none,
              //                       hintText: 'Search',
              //                       hintStyle: TextStyle(
              //                         fontSize: 17,
              //                         color: Colors.black45,
              //                         fontFamily: GoogleFonts.roboto().fontFamily,
              //                       ),
              //                     ),
              //                     style: TextStyle(
              //                       fontSize: 17,
              //                       color: Colors.black,
              //                       fontFamily: GoogleFonts.roboto().fontFamily,
              //                     ),
              //                     onChanged: (value) {
              //                       setState(() {
              //                         searchController.text = value;
              //                         searchController.selection =
              //                             TextSelection.fromPosition(TextPosition(
              //                                 offset:
              //                                     searchController.text.length));
              //                       });
              //                     },
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           IconButton(
              //             onPressed: () {
              //               searchController.clear();
              //               searchController.text = '';
              //               setState(() {});
              //             },
              //             icon: !searchController.text.isEmpty
              //                 ? Icon(
              //                     Icons.cancel,
              //                     color: Colors.black,
              //                   )
              //                 : Icon(
              //                     Icons.cancel,
              //                     color: Colors.black45,
              //                   ),
              //           ),
              //         ],
              //       ),
              //     )
              //   ],
              // ),
              // Divider(
              //   color: Colors.grey[300],
              //   thickness: 1,
              // ),

              MasonryGridView.count(
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 15),
                  itemCount: StaticDB.explore['explore'].length,
                  itemBuilder: (context, int index) {
                    return InkWell(
                      onTap: () {
                        if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetail(
                                    index: 0,
                                    type:
                                        "https://syndication.twitter.com/srv/timeline-profile/screen-name/PIBFactCheck?dnt=false&embedId=twitter-widget-2&frame=false&lang=en&origin=https%3A%2F%2Fmib.gov.in%2F&sessionId=2aa9c03d50b71c24ddc9c2ea78c4c89975cfe8d6&showHeader=true&showReplies=false&widgetsVersion=31f0cdc1eaa0f%3A1660602114609"),
                              ));
                        }
                      },
                      child: SizedBox(
                        height: 120.0,
                        width: 50.0,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.star, color: Colors.blue, size: 70.0),
                              Text(
                                StaticDB.explore['explore'][index]['title'],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              Column(
                children: [
                  SizedBox(
                    height: 60.0,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () => {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ImagePage()))
                          },
                          child: ProgressiveImage(
                            placeholder:
                                AssetImage('assets/aazadi-ka-mahotsav.png'),
                            // size: 1.87KB
                            thumbnail: NetworkImage(
                                StaticDB.images["images"][70]["imageURL"]),
                            // size: 1.29MB
                            image: NetworkImage(
                                StaticDB.images["images"][70]["imageURL"]),
                            height: 180,
                            width: 300,
                          ),
                          // Image.network(StaticDB.images["images"][index]["imageURL"],
                          //     width: 400, height: 200),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 40,
                            width: 300,
                            child: Center(
                              child: Text(
                                "Photos",
                                style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold, fontFamily: GoogleFonts.courgette().fontFamily),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoPage()))
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          ProgressiveImage(
                            placeholder:
                                AssetImage('assets/aazadi-ka-mahotsav.png'),
                            // size: 1.87KB
                            thumbnail: NetworkImage(
                                StaticDB.images["images"][45]["imageURL"]),
                            // size: 1.29MB
                            image: NetworkImage(
                                StaticDB.images["images"][45]["imageURL"]),
                            height: 150,
                            width: 300,
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: 40,
                              width: 300,
                              child: Center(
                                child: Text(
                                  "Videos",
                                  style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold, fontFamily: GoogleFonts.courgette().fontFamily),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
              // Container(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(23, 8, 8, 8),
              //     child: Text("Ministry",
              //         style: TextStyle(
              //             fontSize: 18,
              //             color: Colors.grey[800],
              //             fontWeight: FontWeight.w600,
              //             fontFamily: GoogleFonts.roboto().fontFamily)),
              //   ),
              // ),
              // SizedBox(
              //   child: Stack(children: <Widget>[
              //     ListView.builder(
              //         scrollDirection: Axis.vertical,
              //         physics: const BouncingScrollPhysics(),
              //         shrinkWrap: true,
              //         padding: const EdgeInsets.only(left: 15),
              //         itemCount: StaticDB.releaseAug.keys.length,
              //         itemBuilder: (context, index) {
              //           return
              // Column(children: <Widget>[
              //   // Container(
              //   //   alignment: Alignment.centerLeft,
              //   //   child: Padding(
              //   //     padding: const EdgeInsets.all(8.0),
              //   //     child: Text(
              //   //         StaticDB.releaseAug.keys,
              //   //         style: TextStyle(
              //   //             fontSize: 18,
              //   //             color: Colors.grey[800],
              //   //             fontWeight: FontWeight.w600,
              //   //             fontFamily:
              //   //                 GoogleFonts.roboto().fontFamily)),
              //   //   ),
              //   // ),
              //   SizedBox(
              //     height: MediaQuery.of(context).size.height * 0.43,
              //     child: Stack(children: <Widget>[
              //       ListView.builder(
              //           scrollDirection: Axis.vertical,
              //           physics: const BouncingScrollPhysics(),
              //           shrinkWrap: true,
              //           padding: const EdgeInsets.only(left: 15),
              //           itemCount: StaticDB.releaseAug.keys.length,
              //           itemBuilder: (context, int index) {
              //             return
              //                 // index2 < 4 ?
              //                 InkWell(
              //               onTap: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) => TopNews(
              //                               type: StaticDB.releaseAug.keys
              //                                   .elementAt(index),
              //                             )));
              //               },
              //               child: Container(
              //                 width: MediaQuery.of(context).size.width * 0.45,
              //                 height: MediaQuery.of(context).size.height * 0.15,
              //                 child: Card(
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(20)),
              //                   elevation: 5,
              //                   shadowColor: Colors.blue,
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     children: <Widget>[
              //                       // Hero(
              //                       //   tag: StaticDB.news['news'][index]['id'],
              //                       //   child: Image.asset(
              //                       //       'assets/aazadi-ka-mahotsav.png',
              //                       //       height: MediaQuery.of(context)
              //                       //               .size
              //                       //               .height *
              //                       //           0.05,),
              //                       // ),
              //                       Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: SizedBox(
              //                           height:
              //                               MediaQuery.of(context).size.height *
              //                                   0.2,
              //                           width: MediaQuery.of(context).size.width *
              //                               0.2,
              //                           child: Image.network(
              //                             StaticDB.ministryImage['Ministry']
              //                                 [index]['imageURL'],
              //                           ),
              //                         ),
              //                       ),
              //                       Container(
              //                         width:
              //                             MediaQuery.of(context).size.width * 0.5,
              //                         child: Padding(
              //                           padding: const EdgeInsets.all(8.0),
              //                           child: Text(
              //                             StaticDB.releaseAug.keys
              //                                 .elementAt(index),
              //                             softWrap: true,
              //                             overflow: TextOverflow.ellipsis,
              //                             maxLines: 3,
              //                             style: TextStyle(
              //                                 fontSize: 16,
              //                                 fontFamily: GoogleFonts.roboto()
              //                                     .fontFamily),
              //                           ),
              //                         ),
              //                       ),
              //                       // Divider(),
              //                       // Text(
              //                       //   StaticDB.releaseAug[StaticDB
              //                       //           .releaseAug.keys
              //                       //           .elementAt(index)]
              //                       //       [index]['date'],
              //                       //   softWrap: true,
              //                       //   style: TextStyle(
              //                       //       fontSize: 10,
              //                       //       fontFamily:
              //                       //           GoogleFonts.roboto()
              //                       //               .fontFamily),
              //                       // ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             );
              //             // : Container(
              //             //     width: MediaQuery.of(context)
              //             //             .size
              //             //             .width *
              //             //         0.45,
              //             //     height: MediaQuery.of(context)
              //             //             .size
              //             //             .height *
              //             //         0.1,
              //             //     child: Card(
              //             //         shape: RoundedRectangleBorder(
              //             //             borderRadius:
              //             //                 BorderRadius.circular(
              //             //                     20)),
              //             //         elevation: 5,
              //             //         child: InkWell(
              //             //           onTap: () {
              //             //             // start();
              //             //             Navigator.push(
              //             //                 context,
              //             //                 MaterialPageRoute(
              //             //                     builder: (context) =>
              //             //                         TopNews(
              //             //                           type: StaticDB
              //             //                               .releaseAug
              //             //                               .keys
              //             //                               .elementAt(
              //             //                                   index),
              //             //                         )));
              //             //           },
              //             //           child: Center(
              //             //             child: Text(
              //             //               "Show All",
              //             //               style: TextStyle(
              //             //                   fontSize: 17,
              //             //                   fontFamily:
              //             //                       GoogleFonts.roboto()
              //             //                           .fontFamily),
              //             //             ),
              //             //           ),
              //             //         )));
              //           })
              //     ]),
              //   ),
              //   SizedBox(
              //     height: 10,
              //   ),
              //   // Divider(),
              // ]),
            ],
          ),
        ),
      ),
    );
  }
}
