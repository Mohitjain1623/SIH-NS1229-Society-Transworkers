import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../util/staticDB.dart';

class NewsDetail extends StatefulWidget {
  final int index;
  final String type;

  const NewsDetail({Key? key, required this.index, required this.type})
      : super(key: key);

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  int index = 0;
  var url = "";
  String type = "";

  @override
  void initState() {
    index = widget.index;
    type = widget.type;
    url = StaticDB.releaseAug[type][index]['releaseURL'];
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
        title: Text("Top News",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: GoogleFonts.roboto().fontFamily)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, int index) {
                return Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 50,
                    child: WebView(
                      initialUrl: url,
                      javascriptMode: JavascriptMode.unrestricted,
                      userAgent:
                          'Mozilla/5.0 (Linux; Android 8.1.0; Pixel Build/OPM1.171019.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Mobile Safari/537.36',
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
