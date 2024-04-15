// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:music_site/components/my_button.dart';
import 'package:music_site/components/my_text_field.dart';
import 'package:http/http.dart' as http;

class AddSong extends StatefulWidget {
  const AddSong({super.key});

  @override
  State<AddSong> createState() => _AddSongState();
}

class _AddSongState extends State<AddSong> {
  List artistNames = [];

  Future getArtists() async {
    var url = "https://musicsitedb.000webhostapp.com/API/getArtists.php";
    var responseartist = await http.get(Uri.parse(url));
    if (responseartist.statusCode == 200) {
      var items = json.decode(responseartist.body);
      setState(() {
        artistNames = items;
      });
    }
  }

  var NameselectedArtist;
  var IDselectedArtist;

  @override
  void initState() {
    super.initState();
    getArtists();
  }

  final TextEditingController TitleSongController = TextEditingController();
  final TextEditingController TypeSongController = TextEditingController();
  final TextEditingController PriceSongController = TextEditingController();
  // late int IDArtistController;
  // var PriceSongController;

  Future<void> _addSong(
      String Title, String Type, String Price, String IDartist) async {
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
    final url = Uri.https('musicsitedb.000webhostapp.com', '/API/AddSong.php');
    final response = await http.post(url, body: {
      'Title': Title,
      'Type': Type,
      'Price': Price,
      'ID_artist': IDartist,
    });
    if (mounted) {
      Navigator.of(context).pop();
    }

    if (response.statusCode == 200) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Added Song successful!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
      }

      TitleSongController.text = '';
      TypeSongController.text = '';
      PriceSongController.text = '';
      Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const AddSong()));
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Added failed: ${response.body}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Add Song",
          style: TextStyle(color: Colors.white),
        ),
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo4.jpg",
                width: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(controller: TitleSongController, hintText: "Title"),
              const SizedBox(height: 10),
              MyTextField(controller: TypeSongController, hintText: "Type"),
              const SizedBox(height: 10),
              MyTextField(
                controller: PriceSongController,
                icon: Icons.price_change,
                hintText: "Price",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 203, 202, 202)
                          .withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          hint: const Text("select an artist"),
                          // value: NameselectedArtist ?? emptySelect,
                          items: artistNames.map((artist) {
                            return DropdownMenuItem(
                                value: artist['ID_artist'],
                                child: Text(
                                    artist['Fname'] + ' ' + artist['Lname']));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              NameselectedArtist = artistNames.firstWhere(
                                      (artist) =>
                                          artist['ID_artist'] ==
                                          value)['Fname'] +
                                  ' ' +
                                  artistNames.firstWhere((artist) =>
                                      artist['ID_artist'] == value)['Lname'];
                              IDselectedArtist = value;
                            });
                            // IDArtistController = IDselectedArtist;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IDselectedArtist != null
                  ? Text(
                      "Artist Selected is:  $NameselectedArtist \n his/her Id is: $IDselectedArtist",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 185, 57, 10),
                      ),
                    )
                  : const Text(""),
              const SizedBox(
                height: 12,
              ),
              MyButton(
                customColor: const Color.fromARGB(255, 185, 57, 10),
                text: "Add",
                onTap: () {
                  final TitleSong = TitleSongController.text;
                  final TypeSong = TypeSongController.text;
                  final PriceSong = PriceSongController.text;
                  final ArtistofSong = IDselectedArtist;

                  if (TitleSong != '' &&
                      TypeSong != '' &&
                      PriceSong != '' &&
                      IDselectedArtist != null &&
                      ArtistofSong != '') {
                    _addSong(TitleSong, TypeSong, PriceSong,
                        ArtistofSong.toString());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Verify the input'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
