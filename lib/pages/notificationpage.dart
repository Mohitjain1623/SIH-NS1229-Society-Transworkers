import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List notifications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Notifications',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: GoogleFonts.roboto().fontFamily)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: notifications.isEmpty
            ? Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 170.0, bottom: 20),
                      child: Icon(
                        Icons.notifications,
                        size: 100,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: const Text(
                      "No notifications found",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: notifications.length,
                itemBuilder: (context, int index) {
                  return Dismissible(
                    key: Key(notifications[index]["notificationId"]),
                    // Provide a function that tells the app
                    // what to do after an item has been swiped away.
                    onDismissed: (direction) {
                      print("Notification: " + notifications[index].toString());
                      // Remove the item from the data source.
                      setState(() {
                        notifications.removeAt(index);
                      });

                      // Then show a snackbar.
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Notification deleted")));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            tileColor: Colors.white,
                            minVerticalPadding: 10,
                            isThreeLine: true,
                            leading: SizedBox(
                              width: 50,
                              child: Center(
                                child: Icon(
                                  Icons.notifications,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            title: Text("Notification"),
                          ),
                        ),
                        const Divider(
                          height: 1,
                        )
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
