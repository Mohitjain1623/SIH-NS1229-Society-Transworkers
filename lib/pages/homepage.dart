import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pib_project/util/drawer.dart';

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
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Home Page',
            style: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.roboto().fontFamily)),
      ),
      drawer: MyDrawer(),
    );
  }
}
