import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import '../util/showimage.dart';
import '../util/staticDB.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
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
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text('Images',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              )),
        ),
        body: Column(children: <Widget>[
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.84,
              child: Stack(children: <Widget>[
                MasonryGridView.count(
                  crossAxisCount: 2,
                  itemCount: StaticDB.images['images'].length,
                  itemBuilder:
                      (BuildContext context, int index) {
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
          ),
          SizedBox(
            height: 10,
          ),
        ]));
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
