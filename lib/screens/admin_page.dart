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
                // con: Icon(Icons.abc),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddSong(),
                      ));
                },
              ),
              // GridView.count(
              //   crossAxisCount: 2,
              //   children: List.generate(
              //     choices.length,
              //     (index) {
              //       return Center(
              //         child: SelectCard(choice: choices[index]),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

List<Choice> choices = const <Choice>[
  Choice(title: 'Add an artist', icon: Icons.home),
  Choice(title: 'Add a song  ', icon: Icons.contacts),
  // const Choice(title: 'Map', icon: Icons.map),
  // const Choice(title: 'Phone', icon: Icons.phone),
  // const Choice(title: 'Camera', icon: Icons.camera_alt),
  // const Choice(title: 'Setting', icon: Icons.settings),
  // const Choice(title: 'Album', icon: Icons.photo_album),
  // const Choice(title: 'WiFi', icon: Icons.wifi),
  // const Choice(title: 'GPS', icon: Icons.gps_fixed),
];

class SelectCard extends StatelessWidget {
  const SelectCard({super.key, required this.choice});
  final Choice choice;
  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.titleSmall;
    return Card(
        color: const Color.fromARGB(255, 185, 57, 10),
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child:
                        Icon(choice.icon, size: 50.0, color: textStyle?.color)),
                Text(choice.title, style: textStyle),
              ]),
        ));
  }
}
