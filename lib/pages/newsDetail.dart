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
  bool home = false;
  bool loading = true;

  @override
  void initState() {
    index = widget.index;
    type = widget.type;

    if (type == StaticDB.ytVideo['Youtube'][index]['videoURL']) {
      url = type;
    } else if (type ==
        "https://twitter.com/PIB_India?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor") {
      url = type;
    } else if (type == "https://www.facebook.com/pibindia") {
      url = type;
    } else if (type == "https://www.youtube.com/user/pibindia") {
      url = type;
    } else if (type ==
        "https://twitter.com/PIBFactCheck?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor") {
      url = type;
    } else if (type == "https://www.youtube.com/c/pmoindia") {
      url = type;
    } else if (type ==
        "https://syndication.twitter.com/srv/timeline-profile/screen-name/PIBFactCheck?dnt=false&embedId=twitter-widget-2&frame=false&lang=en&origin=https%3A%2F%2Fmib.gov.in%2F&sessionId=2aa9c03d50b71c24ddc9c2ea78c4c89975cfe8d6&showHeader=true&showReplies=false&widgetsVersion=31f0cdc1eaa0f%3A1660602114609") {
      url = type;
    } else if (type == "https://www.kooapp.com/profile/PIB_India") {
      url = type;
    }
    else if (type == "hindi") {
      url = StaticDB.pressRelease['rss']['channel'][0]['item'][index]['link'];
    }else if (type == "telugu") {
      url = StaticDB.pressRelease['rss']['channel'][1]['item'][index]['link'];
    }else if (type == "tamil") {
      url = StaticDB.pressRelease['rss']['channel'][2]['item'][index]['link'];
    }
    else if (type == "punjabi") {
      url = StaticDB.pressRelease['rss']['channel'][3]['item'][index]['link'];
    }else if (type == "bengali") {
      url = StaticDB.pressRelease['rss']['channel'][4]['item'][index]['link'];
    }else if (type == "kannada") {
      url = StaticDB.pressRelease['rss']['channel'][5]['item'][index]['link'];
    }else if (type == "english") {
      url = StaticDB.pressRelease['rss']['channel'][6]['item'][index]['link'];
    }else if (type == "gujrati") {
      url = StaticDB.pressRelease['rss']['channel'][7]['item'][index]['link'];
    }else if (type == "assamese") {
      url = StaticDB.pressRelease['rss']['channel'][8]['item'][index]['link'];
    }else if (type == "malyalam") {
      url = StaticDB.pressRelease['rss']['channel'][9]['item'][index]['link'];
    }
    else {
      url = StaticDB.releaseAug[type][index]['releaseURL'];
    }

    if (url ==
        "https://syndication.twitter.com/srv/timeline-profile/screen-name/PIBFactCheck?dnt=false&embedId=twitter-widget-2&frame=false&lang=en&origin=https%3A%2F%2Fmib.gov.in%2F&sessionId=2aa9c03d50b71c24ddc9c2ea78c4c89975cfe8d6&showHeader=true&showReplies=false&widgetsVersion=31f0cdc1eaa0f%3A1660602114609") {
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: home
            ? Container()
            : IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
        // centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Press Information Bureau",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: GoogleFonts.roboto().fontFamily)),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            userAgent:
                'Mozilla/5.0 (Linux; Android 8.1.0; Pixel Build/OPM1.171019.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Mobile Safari/537.36',
            onPageFinished: (finish) {
              setState(() {
                loading = false;
              });
            },
          ),
          loading ? Center(child: CircularProgressIndicator()) : Container(),
        ],
      ),
    );
  }
}
