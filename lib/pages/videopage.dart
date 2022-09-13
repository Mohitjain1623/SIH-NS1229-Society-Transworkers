import 'package:flutter/material.dart';
import 'package:pib_project/pages/newsDetail.dart';
import 'package:pib_project/pages/topnews.dart';
import 'package:progressive_image/progressive_image.dart';

import '../util/staticDB.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Video", style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed:() {
            Navigator.of(context).pop();
          }
        ),
      ),
      body:
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.99,
        child: Stack(children: <Widget>[
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 15),
              itemCount: StaticDB.ytVideo['Youtube'].length,
              itemBuilder: (context, int index) {
                return
                  // index2 < 4 ?
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetail(index : 0,type: StaticDB.ytVideo['Youtube'][index]['videoURL'],)));
                    },
                    child: Container(
                      width: MediaQuery.of(context)
                          .size
                          .width *
                          0.45,
                      height: MediaQuery.of(context)
                          .size
                          .height *
                          0.4,
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: ProgressiveImage(
                              placeholder:
                              AssetImage('assets/aazadi-ka-mahotsav.png'),
                              // size: 1.87KB
                              thumbnail: NetworkImage(
                                  StaticDB.ytVideo['Youtube'][index]['videoView']),
                              // size: 1.29MB
                              image: NetworkImage(
                                  StaticDB.ytVideo['Youtube'][index]['videoView']),
                              width: MediaQuery.of(context)
                                  .size
                                  .width *
                                  0.9,
                              height: MediaQuery.of(context)
                                  .size
                                  .height *
                                  0.35,
                            ),
                          )
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
              })
        ]),
      ),
    );
  }
}
