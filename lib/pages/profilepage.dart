import 'package:flutter/material.dart';
import 'package:pib_project/pages/accountpage.dart';
import 'package:pib_project/pages/interestpage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              color: Colors.blue[100],
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.topRight,
              //     end: Alignment.bottomLeft,
              //     colors: [
              //       Colors.green,
              //       Colors.orange,
              //     ],
              //   ),
              // ),
              margin: EdgeInsets.zero,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(85.0),
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 30,
                            offset: Offset(0, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 70,
                      width: double.infinity,
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                          title: Text('My Account'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InterestPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 30,
                            offset: Offset(0, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 70,
                      width: double.infinity,
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.add_box,
                            color: Colors.blue,
                          ),
                          title: Text('Ministry of Interest'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
