// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:music_site/screens/add_artist.dart';
import 'package:music_site/screens/add_song.dart';
import 'package:music_site/screens/login_screen.dart';
import 'package:music_site/screens/login_signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   textTheme: GoogleFonts.poppinsTextTheme(
      //     Theme.of(context).textTheme,
      //   ),
      // ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      home: const LoginSignupScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const LoginSignupScreen(),
        '/AddArtist': (context) => const AddArtist(),
        '/AddSong': (context) => const AddSong(),
      },
    );
  }
}
