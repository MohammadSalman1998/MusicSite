// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DisplayArtistPage extends StatefulWidget {
  const DisplayArtistPage({super.key});

  @override
  State<DisplayArtistPage> createState() => _DisplayArtistPageState();
}

class _DisplayArtistPageState extends State<DisplayArtistPage> {
  int pressedItemIndex = -1;
  bool showCardForItem = false;
  List artistList = [];
  Future getArtists() async {
    try {
      var url =
          "https://musicsitedb.000webhostapp.com/API/getAllartistWithDetails.php";
      var responseartist = await http.get(Uri.parse(url));
      if (responseartist.statusCode == 200) {
        var items = json.decode(responseartist.body);
        setState(() {
          artistList = items;
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
    getArtists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: const Text(
            "All Artist",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
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
            itemCount: artistList.length,
            itemBuilder: (cts, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Artist Name: ${artistList[i]["Fname"]} ${artistList[i]["Lname"]}",
                        style: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 73, 47, 7),
                            fontFamily: 'Times New Roman'),
                      ),
                      subtitle:
                          Text("Artist gender: ${artistList[i]["gender"]}"),
                      leading: CircleAvatar(
                        radius: 20,
                        child: Text(
                            "${artistList[i]["Fname"].toString().substring(0, 2)}"),
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
                      // tileColor: pressedItemIndex == i
                      //     ? const Color.fromARGB(179, 255, 153, 0)
                      //     : Color.fromARGB(136, 202, 91, 50),

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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Artist country: ${artistList[i]["country"]}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  "Artist's songs: ${artistList[i]["Title"]}",
                                  style: const TextStyle(fontSize: 18),
                                )
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
