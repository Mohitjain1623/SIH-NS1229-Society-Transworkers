import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pib_project/pages/topnews.dart';
import 'package:pib_project/util/Constants.dart';
import '../routes.dart';
import '../util/dashboard.dart';
import '../util/staticDB.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({Key? key}) : super(key: key);

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  bool selected = false;
  int selectedCount = 0;
  List<String> arr = new List.filled(17, "", growable: false);
  List<bool> arr2 = new List.filled(17, false, growable: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
          height: 50.0,
          width: 50.0,
          child: IconButton(
            icon: Icon(Icons.arrow_circle_right_outlined),
            iconSize: 50.0,
            color: Colors.blue,
            onPressed: () {
              Constants.setInterests(true, arr);
              setState(() {});
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashBoard()));
            },
          )),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(
                  "Choose maximum 2 Ministries",
                  textAlign: TextAlign.left,
                ),
                width: MediaQuery.of(context).size.width,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.91,
              child: Stack(children: <Widget>[
                MasonryGridView.count(
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 15),
                    itemCount: StaticDB.releaseAug.keys.length,
                    itemBuilder: (context, int index) {
                      return
                          // index2 < 4 ?
                          Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.285,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 5,
                          shadowColor: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  Checkbox(
                                    value: arr2[index],
                                    shape: CircleBorder(),
                                    onChanged: (value) {
                                      selectedCount < 2
                                          ? setState(() {
                                              if (arr2[index] == false) {
                                                selectedCount++;
                                                arr2[index] = true;
                                                arr[index] = StaticDB
                                                    .releaseAug.keys
                                                    .elementAt(index);
                                              } else {
                                                selectedCount--;
                                                arr2[index] = false;
                                                arr[index] = "";
                                              }
                                            })
                                          : Container();
                                    },
                                  )
                                ],
                              ),
                              // Hero(
                              //   tag: StaticDB.news['news'][index]['id'],
                              //   child: Image.asset(
                              //       'assets/aazadi-ka-mahotsav.png',
                              //       height: MediaQuery.of(context)
                              //               .size
                              //               .height *
                              //           0.05,),
                              // ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.14,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Image.network(
                                  StaticDB.ministryImage['Ministry'][index]
                                      ['imageURL'],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  StaticDB.releaseAug.keys.elementAt(index),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily:
                                          GoogleFonts.roboto().fontFamily),
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
