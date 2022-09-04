import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import '../util/Constants.dart';
import '../util/dashboard.dart';
import '../util/staticDB.dart';

class LanguagePage extends StatefulWidget {
  final bool start;
  const LanguagePage({Key? key, required this.start}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  bool start = true;
  bool selected = false;
  int selectedCount = -1;
  List<String> arr = new List.filled(17, "", growable: false);
  List<bool> arr2 = new List.filled(17, false, growable: false);

  @override
  void initState() {
    start = widget.start;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   title: Text('Select any 1 Language',style: TextStyle(color: Colors.black),),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back,color: Colors.black,),
      //     onPressed: (){
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
      body: SafeArea(
        top: true,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Choose your",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: GoogleFonts.merriweather().fontFamily),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Text("Language",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 40,
                        fontFamily: GoogleFonts.merriweather().fontFamily)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Stack(children: <Widget>[
                MasonryGridView.count(
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 15),
                    itemCount: StaticDB.langImage['langImage'].length,
                    itemBuilder: (context, int index) {
                      return
                          // index2 < 4 ?
                          Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.08,
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
                                setState(() {
                                  if (arr2[index] == false) {
                                    if(selectedCount!=-1){
                                      arr2[selectedCount] = false;
                                      arr[selectedCount] = '';
                                    }
                                    // selectedCount++;
                                    arr2[index] = true;
                                    arr[index] = StaticDB.langImage['langImage']
                                        [index]['title'];
                                    selectedCount = index;
                                    selected = true;
                                  } else {
                                    // selectedCount--;
                                    arr2[index] = false;
                                    arr[index] = "";
                                    selected = false;
                                  }
                                });
                              },
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: arr2[index],
                                    shape: CircleBorder(),
                                    onChanged: (value) {
                                      setState(() {
                                        if (arr2[index] == false) {
                                          if(selectedCount!=-1){
                                            arr2[selectedCount] = false;
                                            arr[selectedCount] = '';
                                          }
                                          // selectedCount++;
                                          arr2[index] = true;
                                          arr[index] =
                                              StaticDB.langImage['langImage']
                                                  [index]['title'];
                                          selectedCount = index;
                                          selected = true;
                                        } else {
                                          // selectedCount--;
                                          arr2[index] = false;
                                          arr[index] = "";
                                          selected = false;
                                        }
                                      });
                                      // : Container();
                                    },
                                  ),
                                  // Image.network(StaticDB.langImage['langImage'][index]['imageURL'],height: 50,),
                                  Text(
                                    StaticDB.langImage['langImage'][index]
                                            ['title']
                                        .toLowerCase()
                                        .split(" ")
                                        .map((word) =>
                                            word[0].toUpperCase() +
                                            word.substring(1, word.length))
                                        .join(" "),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: GoogleFonts.merriweather()
                                            .fontFamily),
                                  ),
                                ],
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
            Container(
                // padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
                height: 50.0,
                width: 150.0,
                child: InkWell(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Get Started",
                        style: GoogleFonts.merriweather(
                          fontSize: 18,
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    if (selected) {
                      Constants.setLanguage(true, selectedCount);
                      if(start){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => DashBoard()),
                        );
                      }
                      else{
                        Navigator.pop(context);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Language Selected Successfully'),
                        backgroundColor: Colors.green,
                      ));
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Select Atleast One Language'),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
