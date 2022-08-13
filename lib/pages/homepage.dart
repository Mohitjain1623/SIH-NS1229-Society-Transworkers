import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Home Page',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: GoogleFonts.roboto().fontFamily)),
      ),
      body: Column(
        children: [Row()],
      ),
    );
  }
}
