import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pib_project/pages/topnews.dart';

import '../util/staticDB.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Column(
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

            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(23, 8, 8, 8),
                child: Text("Ministry",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.roboto().fontFamily)),
              ),
            ),
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
            Column(children: <Widget>[
              // Container(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text(
              //         StaticDB.releaseAug.keys,
              //         style: TextStyle(
              //             fontSize: 18,
              //             color: Colors.grey[800],
              //             fontWeight: FontWeight.w600,
              //             fontFamily:
              //                 GoogleFonts.roboto().fontFamily)),
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.77,
                child: Stack(children: <Widget>[
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(left: 15),
                      itemCount: StaticDB.releaseAug.keys.length,
                      itemBuilder: (context, int index) {
                        return
                            // index2 < 4 ?
                            InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TopNews(
                                          type: StaticDB.releaseAug.keys
                                              .elementAt(index),
                                        )));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 5,
                              shadowColor: Colors.blue,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.2,
                                      width: MediaQuery.of(context).size.width * 0.2,
                                      child: Image.network(
                                        StaticDB.ministryImage['Ministry'][index]
                                            ['imageURL'],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        StaticDB.releaseAug.keys.elementAt(index),
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily:
                                                GoogleFonts.roboto().fontFamily),
                                      ),
                                    ),
                                  ),
                                  // Divider(),
                                  // Text(
                                  //   StaticDB.releaseAug[StaticDB
                                  //           .releaseAug.keys
                                  //           .elementAt(index)]
                                  //       [index]['date'],
                                  //   softWrap: true,
                                  //   style: TextStyle(
                                  //       fontSize: 10,
                                  //       fontFamily:
                                  //           GoogleFonts.roboto()
                                  //               .fontFamily),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        );
                        // : Container(
                        //     width: MediaQuery.of(context)
                        //             .size
                        //             .width *
                        //         0.45,
                        //     height: MediaQuery.of(context)
                        //             .size
                        //             .height *
                        //         0.1,
                        //     child: Card(
                        //         shape: RoundedRectangleBorder(
                        //             borderRadius:
                        //                 BorderRadius.circular(
                        //                     20)),
                        //         elevation: 5,
                        //         child: InkWell(
                        //           onTap: () {
                        //             // start();
                        //             Navigator.push(
                        //                 context,
                        //                 MaterialPageRoute(
                        //                     builder: (context) =>
                        //                         TopNews(
                        //                           type: StaticDB
                        //                               .releaseAug
                        //                               .keys
                        //                               .elementAt(
                        //                                   index),
                        //                         )));
                        //           },
                        //           child: Center(
                        //             child: Text(
                        //               "Show All",
                        //               style: TextStyle(
                        //                   fontSize: 17,
                        //                   fontFamily:
                        //                       GoogleFonts.roboto()
                        //                           .fontFamily),
                        //             ),
                        //           ),
                        //         )));
                      })
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              // Divider(),
            ]),
          ],
        ),
      ),
    );
  }
}
