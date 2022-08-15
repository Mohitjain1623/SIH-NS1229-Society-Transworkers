import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

String userName = "";
String userNumber = "";

checkUserLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('isLoggedIn') == true) {
    userName = prefs.getString('username')!;
    userNumber = prefs.getString('userNumber')!;
    print(userName);
    return true;
  } else {
    return false;
    userName = "Enter UserName";
    userNumber = "Enter UserNumber";
  }
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.green,
                  Colors.orange,
                ],
              ),
            ),
            margin: EdgeInsets.zero,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(45.0),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/Flag_of_India.png'),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            minVerticalPadding: 15,
            title: TextFormField(
              enabled: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                  icon: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.black,
                    size: 30,
                  ),
                  labelText: userName),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            minVerticalPadding: 15.0,
            title: TextFormField(
              enabled: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
                icon: Icon(
                  CupertinoIcons.phone_circle,
                  color: Colors.black,
                  size: 30,
                ),
                hintText: userNumber,
              ),
              style: TextStyle(
                color: Colors.black26,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(80.0, 10.0, 80.0, 0.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shadowColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
                elevation: 5,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
