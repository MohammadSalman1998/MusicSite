import 'package:flutter/material.dart';
import 'package:music_site/components/my_button.dart';
import 'package:music_site/components/my_text_field.dart';
import 'package:music_site/screens/admin_page.dart';
import 'package:music_site/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPass = false;
  showPassword() {
    setState(() {
      showPass = !showPass;
    });
  }

  bool chekTheBox = false;
  check() {
    setState(() {
      chekTheBox = !chekTheBox;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Log In",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 185, 57, 10),
      ),
      backgroundColor: Colors.white,
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
              const MyTextField(
                hintText: "Email or User Name",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              MyTextField(
                hintText: "Password",
                onPressed: showPassword,
                obsecureText: showPass ? false : true,
                icon: showPass ? Icons.visibility_off : Icons.visibility,
              ),
              // const SizedBox(
              //   height: 12,
              // ),
              // Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 25),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Row(
              //         children: [
              //           Theme(
              //             data: ThemeData(
              //               unselectedWidgetColor: Colors.grey[500],
              //             ),
              //             // child: Checkbox(
              //             //   checkColor: Colors.white,
              //             //   value: chekTheBox ? true : false,
              //             //   onChanged: (value) {
              //             //     check();
              //             //   },
              //             // ),
              //           ),
              //           // const Text(
              //           //   "Remember me",
              //           //   style: TextStyle(
              //           //     color: Color.fromARGB(255, 250, 8, 8),
              //           //   ),
              //           // ),
              //         ],
              //       ),
              //       // const Text(
              //       //   "Forgot Password?",
              //       //   style: TextStyle(
              //       //     color: Color.fromARGB(255, 238, 130, 6),
              //       //     fontWeight: FontWeight.bold,
              //       //   ),
              //       // ),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                customColor: const Color.fromARGB(255, 185, 57, 10),
                text: "Sign IN",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdminPage(),
                      ));
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 238, 48, 6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color.fromARGB(255, 238, 130, 6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
