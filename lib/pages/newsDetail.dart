import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/staticDB.dart';

class NewsDetail extends StatefulWidget {
  final int index;
  const NewsDetail({Key? key, required this.index}) : super(key: key);

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  int index = 0;

  @override
  void initState() {
    index = widget.index;
    super.initState();
  }

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
        title: Text(StaticDB.news['news'][index]['title'],
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: GoogleFonts.roboto().fontFamily)),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: StaticDB.news['news'][index]['id'],
                      child: Image.asset(
                        'assets/aazadi-ka-mahotsav.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        StaticDB.news['news'][index]['subtitle'],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.roboto().fontFamily),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      StaticDB.news['news'][index]['description'],
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: GoogleFonts.roboto().fontFamily),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
