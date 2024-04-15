import 'package:flutter/material.dart';
import 'package:music_site/components/my_button.dart';
import 'package:music_site/screens/add_artist.dart';
import 'package:music_site/screens/add_song.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin",
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
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                "assets/logo4.jpg",
                width: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                customColor: const Color.fromARGB(255, 185, 57, 10),
                text: "Add an artist",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddArtist(),
                      ));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                customColor: const Color.fromARGB(255, 185, 57, 10),
                text: "Add a song",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddSong(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
