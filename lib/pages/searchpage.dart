import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 5)),
          Row(
            children: [
              SafeArea(
                top: true,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 38,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey[300],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.search,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              cursorColor: Colors.black,
                              focusNode: searchFocusNode,
                              controller: searchController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black45,
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontFamily: GoogleFonts.roboto().fontFamily,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  searchController.text = value;
                                  searchController.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset:
                                              searchController.text.length));
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        searchController.clear();
                        searchController.text = '';
                        setState(() {});
                      },
                      icon: !searchController.text.isEmpty
                          ? Icon(
                              Icons.cancel,
                              color: Colors.black,
                            )
                          : Icon(
                              Icons.cancel,
                              color: Colors.black45,
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
