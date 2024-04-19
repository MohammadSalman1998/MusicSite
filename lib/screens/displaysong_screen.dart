// ignore_for_file: non_constant_identifier_names, avoid_print, unnecessary_string_interpolations, file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DisplaySongPage extends StatefulWidget {
  final String IDCust;
  const DisplaySongPage({super.key, required this.IDCust});

  @override
  State<DisplaySongPage> createState() => _DisplaySongPageState();
}

class _DisplaySongPageState extends State<DisplaySongPage> {
  int pressedItemIndex = -1;
  bool showCardForItem = false;
  List songsList = [];
  List mysongsList = [];
  // List filteredSongsList = [];
  // final TextEditingController _searchController = TextEditingController();
  Future getSongs() async {
    try {
      var url = "https://musicsitedb.000webhostapp.com/API/getSongs.php";
      var responseartist = await http.get(Uri.parse(url));
      if (responseartist.statusCode == 200) {
        var items = json.decode(responseartist.body);
        setState(() {
          songsList = items;
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

  final TextEditingController CreditCardController = TextEditingController();
  late String totalPrice;
  late String ID_song;

  Future<void> _buySong(
      String CreditCard, String Total, String ID, String SongID) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return Center(
                child: CircularProgressIndicator(
              color: const Color.fromARGB(255, 185, 57, 10),
              backgroundColor:
                  const Color.fromARGB(255, 203, 202, 202).withOpacity(0.5),
            ));
          });

      final url =
          Uri.parse('https://musicsitedb.000webhostapp.com/API/buySong.php');
      final response = await http.post(url, body: {
        'Total': Total.toString(),
        'CreditCard': CreditCard,
        'IDCustomer': ID,
        'ID_song': SongID,
      });
      if (mounted) {
        Navigator.of(context).pop();
      }

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          try {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('The song successful buy it!'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 3),
                ),
              );
              CreditCardController.text = '';
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                      'Congratulations, the song has been downloaded',
                      style: TextStyle(
                        color: Colors.greenAccent,
                      ),
                    ),
                    actions: <Widget>[
                      Text(
                        "The amount of ${totalPrice.toString()}\$ has been withdrawn from your balance ",
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        child: const Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            getMySongs(widget.IDCust);
                            getSongs();
                          });
                        },
                      ),
                    ],
                  );
                },
              );
            }
          } catch (e) {
            if (e is FormatException) {
              print('FormatException: $e');
            } else {
              print('Unknown exception: $e');
            }
          }
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${response.statusCode}'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
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

  Future<void> getMySongs(String myID) async {
    try {
      var url =
          Uri.parse("https://musicsitedb.000webhostapp.com/API/mySongs.php");
      final responseartistmySong = await http.post(url, body: {
        'ID_customer': myID,
      });
      if (responseartistmySong.statusCode == 200) {
        var mySongItems = json.decode(responseartistmySong.body);
        setState(() {
          mysongsList = mySongItems;
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

  String id = '';
  @override
  void initState() {
    getMySongs(widget.IDCust);
    getSongs();
    id = widget.IDCust;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: const Text(
            "All Songs ",
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
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.search),
          //     onPressed: () {
          //       setState(() {
          //         if (_searchController.text.isNotEmpty) {
          //           songsList
          //               .where((song) => song["Title"]
          //                   .toLowerCase()
          //                   .contains(_searchController.text.toLowerCase()))
          //               .toList();
          //         } else {
          //           // filteredSongsList = songsList;
          //           songsList = filteredSongsList;
          //         }
          //       });
          //     },
          //   ),
          //   const SizedBox(
          //     width: 10,
          //   ),
          //   Expanded(
          //     child: TextField(
          //       controller: _searchController,
          //       decoration: const InputDecoration(
          //         hintText: "Search",
          //         border: InputBorder.none,
          //         contentPadding: EdgeInsets.symmetric(horizontal: 16),
          //       ),
          //       onChanged: (value) {
          //         setState(() {
          //           if (value.isNotEmpty) {
          //             filteredSongsList = songsList
          //                 .where((song) => song["Title"]
          //                     .toLowerCase()
          //                     .contains(value.toLowerCase()))
          //                 .toList();
          //           } else {
          //             filteredSongsList = songsList;
          //           }
          //         });
          //       },
          //     ),
          //   ),
          // ],
        ),
        body: ListView.builder(
            itemCount: songsList.length,
            itemBuilder: (cts, i) {
              final item = songsList[i]['Title'];
              // final isDownloaded = mysongsList.contains(item);
              final isDownloaded =
                  mysongsList.any((element) => element['Title'] == item);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Title Song: ${songsList[i]["Title"]}",
                        style: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 73, 47, 7),
                            fontFamily: 'Times New Roman'),
                      ),
                      subtitle: Text("Type of Song: ${songsList[i]["Type"]}"),
                      leading: CircleAvatar(
                        radius: 20,
                        child: Text(
                            "${songsList[i]["Title"].toString().substring(0, 2)}"),
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
                            totalPrice = songsList[i]["Price"].toString();
                            ID_song = songsList[i]["ID_song"].toString();
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
                                      "Price of song is: ${songsList[i]["Price"]}\$",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      "The Artist is: ${songsList[i]["Fname"]} ${songsList[i]["Lname"]}",
                                      style: const TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                                isDownloaded == false
                                    ? IconButton(
                                        icon: const Icon(Icons.download),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Enter Credit Card Number'),
                                                content: TextField(
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText:
                                                        'Credit Card Number',
                                                  ),
                                                  controller:
                                                      CreditCardController,
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text('Cancel'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child:
                                                        const Text('Download'),
                                                    onPressed: () {
                                                      final creditCard =
                                                          CreditCardController
                                                              .text;
                                                      final TotalPrice =
                                                          totalPrice.toString();
                                                      final IDsong =
                                                          ID_song.toString();

                                                      if (creditCard != '') {
                                                        _buySong(
                                                            creditCard,
                                                            TotalPrice,
                                                            id,
                                                            IDsong);
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            content: Text(
                                                                'Verify the input'),
                                                            backgroundColor:
                                                                Colors.red,
                                                            duration: Duration(
                                                                seconds: 1),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      )
                                    : IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.download_done))
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
