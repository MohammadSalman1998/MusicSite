import 'package:flutter/material.dart';
// import 'package:music_site/screens/add_artist.dart';
// import 'package:music_site/screens/add_song.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:music_site/screens/login_signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(
      //   textTheme: GoogleFonts.poppinsTextTheme(
      //     Theme.of(context).textTheme,
      //   ),
      // ),
      debugShowCheckedModeBanner: false,
      home: LoginSignupScreen(),
      // home: AddSong(),
    );
  }
}
