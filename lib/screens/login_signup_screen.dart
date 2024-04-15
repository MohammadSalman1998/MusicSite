// ignore_for_file: file_names

// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:music_site/components/my_button.dart';
import 'package:music_site/screens/login_screen.dart';
import 'package:music_site/screens/signup_screen.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  // // ignore: prefer_typing_uninitialized_variables
  // var internetResult;
  // initDateOfInternet() async {
  //   internetResult = await CheckInternet();
  //   if (internetResult == false) {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text("No Internet Connection ..."),
  //           backgroundColor: Color.fromARGB(255, 255, 28, 7),
  //           duration: Duration(seconds: 3),
  //         ),
  //       );
  //     }
  //   }
  // }

  // @override
  // void initState() {
  //   initDateOfInternet();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 19, 18, 18),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Image.asset(
                      "assets/logo4.jpg",
                      width: 400,
                    ),
                  ),
                  MyButton(
                    customColor: const Color.fromARGB(255, 222, 134, 134),
                    text: 'Sign In',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    customColor: const Color.fromARGB(255, 185, 57, 10),
                    text: 'Create an account',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
//   CheckInternet() async {
//     try {
//       var resultCheckInternet =
//           await InternetAddress.lookup("musicsitedb.000webhostapp.com");
//       if (resultCheckInternet.isNotEmpty &&
//           resultCheckInternet[0].rawAddress.isNotEmpty) {
//         return true;
//       }
//     } on SocketException catch (_) {
//       return false;
//     }
//   }
}
