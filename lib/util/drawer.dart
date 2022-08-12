import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
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
                accountName: Text("Sourabh Yadav",
                  style: TextStyle(
                      color: Colors.white
                  ),),
                accountEmail: Text("sourabhyadav564@gmail.com",
                  style: TextStyle(
                      color: Colors.white
                  ),),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/Flag_of_India.png"),

                ),
              )),
          ListTile(
            minVerticalPadding: 25.0,
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.blue,
              size: 40.0,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          ListTile(
            minVerticalPadding: 25.0,
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.blue,
              size: 40.0,
            ),
            title: Text(
              "Account",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          ListTile(
            minVerticalPadding: 25.0,
            leading: Icon(
              CupertinoIcons.arrow_right_circle,
              color: Colors.blue,
              size: 40.0,
            ),
            title: Text(
              "Logout",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
