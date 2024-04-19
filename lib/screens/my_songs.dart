// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MySongs extends StatefulWidget {
  final String IDCust;
  const MySongs({super.key, required this.IDCust});

  @override
  State<MySongs> createState() => _MySongsState();
}

class _MySongsState extends State<MySongs> {
  int pressedItemIndex = -1;
  bool showCardForItem = false;
  List mysongsList = [];
  Future<void> getMySongs(String myID) async {
    try {
      var url =
          Uri.parse("https://musicsitedb.000webhostapp.com/API/mySongs.php");
      final responseartist = await http.post(url, body: {
        'ID_customer': myID,
      });
      if (responseartist.statusCode == 200) {
        var items = json.decode(responseartist.body);
        setState(() {
          mysongsList = items;
          // filteredSongsList = items;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No internet connection'),
            backgroundColor: Color.fromARGB(255, 255, 28, 7),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    getMySongs(widget.IDCust);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: const Text(
            "My Songs ",
            style: TextStyle(color: Colors.white),
          ),
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.logout),
          //     onPressed: () {
          //       Navigator.pushReplacementNamed(context, '/login');
          //     },
          //   ),
          // ],
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 185, 57, 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: mysongsList.length,
            itemBuilder: (cts, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Title Song: ${mysongsList[i]["Title"]}",
                        style: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 73, 47, 7),
                            fontFamily: 'Times New Roman'),
                      ),
                      subtitle: Text("Type of Song: ${mysongsList[i]["Type"]}"),
                      leading: CircleAvatar(
                        radius: 20,
                        child: Text(
                            "${mysongsList[i]["Title"].toString().substring(0, 2)}"),
                      ),
                      trailing: IconButton.filled(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            pressedItemIndex = i;
                            showCardForItem = !showCardForItem;
                          });
                        },
                        icon: const Icon(Icons.info),
                      ),
                      dense: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      tileColor: const Color.fromARGB(136, 202, 91, 50),
                      selected: pressedItemIndex == i && showCardForItem,
                      selectedTileColor: const Color.fromARGB(179, 255, 153, 0),
                      enabled: true,
                      focusColor: Colors.white,
                      hoverColor: Colors.white,
                      splashColor: Colors.white,
                    ),
                    if (showCardForItem && pressedItemIndex == i)
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5.0,
                          margin: const EdgeInsets.all(16.0),
                          color: Colors.white,
                          shadowColor: Colors.black,
                          clipBehavior: Clip.antiAlias,
                          surfaceTintColor: Colors.orange,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Price of song is: ${mysongsList[i]["Total"]}\$",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      "The Artist is: ${mysongsList[i]["Fname"]} ${mysongsList[i]["Lname"]}",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      "Downloaded at: ${mysongsList[i]["Date"]}",
                                      style: const TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }));
  }
}
