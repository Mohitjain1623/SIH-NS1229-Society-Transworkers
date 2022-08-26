import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/Constants.dart';
import '../util/staticDB.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Select any 1 Language',style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        top: true,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.87,
              child: Stack(children: <Widget>[
                MasonryGridView.count(
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 15),
                    itemCount: StaticDB.pressRelease['rss']['channel'].length,
                    itemBuilder: (context, int index) {
                      return
                          // index2 < 4 ?
                          InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 5,
                            // color: arr2[index] ? Colors.blue[50] : Colors.white,
                            shadowColor: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                // Row(
                                //   children: [
                                    // Checkbox(
                                    //   value: false,
                                    //   shape: CircleBorder(),
                                    //   onChanged: (value) {
                                    //     // selectedCount < 17
                                    //     //     ? setState(() {
                                    //     //         if (arr2[index] == false) {
                                    //     //           selectedCount++;
                                    //     //           arr2[index] = true;
                                    //     //           arr[index] = StaticDB
                                    //     //               .releaseAug.keys
                                    //     //               .elementAt(index);
                                    //     //         } else {
                                    //     //           selectedCount--;
                                    //     //           arr2[index] = false;
                                    //     //           arr[index] = "";
                                    //     //         }
                                    //     //       })
                                    //     //     : Container();
                                    //   },
                                    // )
                                //   ],
                                // ),
                                // Hero(
                                //   tag: StaticDB.news['news'][index]['id'],
                                //   child: Image.asset(
                                //       'assets/aazadi-ka-mahotsav.png',
                                //       height: MediaQuery.of(context)
                                //               .size
                                //               .height *
                                //           0.05,),
                                // ),
                                // SizedBox(
                                //   height:
                                //       MediaQuery.of(context).size.height * 0.14,
                                //   width: MediaQuery.of(context).size.width * 0.2,
                                //   child: Image.network(
                                //     StaticDB.ministryImage['Ministry'][index]
                                //         ['imageURL'],
                                //   ),
                                // ),
                                InkWell(
                                  onTap: () {
                                    Constants.setLanguage(true, index);
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text('Language Selected Successfully'),
                                      backgroundColor: Colors.green,
                                    ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(45.0),
                                    child: Column(
                                      children: [
                                        Image.network(StaticDB.langImage['langImage'][index]['imageURL'],height: 50,),
                                        Text(
                                          StaticDB.pressRelease['rss']['channel'][index]['language'].toUpperCase(),
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  GoogleFonts.roboto().fontFamily),
                                        ),
                                      ],
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
          ],
        ),
      ),
    );
  }
}
