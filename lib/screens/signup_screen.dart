import 'package:flutter/material.dart';
import 'package:music_site/components/my_button.dart';
import 'package:music_site/components/my_text_field.dart';
import 'package:music_site/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool showPass = false;
  bool showConfirm = false;
  showConfPass() {
    setState(() {
      showConfirm = !showConfirm;
    });
  }

  showPassword() {
    setState(() {
      showPass = !showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Create Account",
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
              // const SizedBox(
              //   height: 40,
              // ),
              Image.asset(
                "assets/logo4.jpg",
                width: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              const MyTextField(hintText: "User Name"),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Expanded(
                    // flex: 2,
                    child: MyTextField(hintText: "First Name"),
                  ),
                  // SizedBox(height: 10),
                  Expanded(
                    // flex: 3,
                    child: MyTextField(hintText: "Last Name"),
                  ),
                  // SizedBox(height: 10),
                ],
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Password",
                onPressed: showPassword,
                obsecureText: showPass ? false : true,
                icon: showPass ? Icons.visibility_off : Icons.visibility,
              ),
              const SizedBox(height: 10),

              MyTextField(
                hintText: "Confirm Password",
                onPressed: showConfPass,
                obsecureText: showConfirm ? false : true,
                icon: showConfirm ? Icons.visibility_off : Icons.visibility,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       // flex: 2,
              //       child: MyTextField(
              //         hintText: "Password",
              //         onPressed: showPassword,
              //         obsecureText: showPass ? false : true,
              //         icon: showPass ? Icons.visibility_off : Icons.visibility,
              //       ),
              //     ),
              //     // SizedBox(height: 10),
              //     Expanded(
              //       // flex: 1,
              //       child: MyTextField(
              //         hintText: "Confirm Password",
              //         onPressed: showConfPass,
              //         obsecureText: showConfirm ? false : true,
              //         icon:
              //             showConfirm ? Icons.visibility_off : Icons.visibility,
              //       ),
              //     ),
              //     // SizedBox(height: 10),
              //   ],
              // ),

              // MyTextField(
              //   hintText: "Password",
              //   onPressed: showPassword,
              //   obsecureText: showPass ? false : true,
              //   icon: showPass ? Icons.visibility_off : Icons.visibility,
              // ),
              // const SizedBox(height: 10),
              // MyTextField(
              //   hintText: "Confirm Password",
              //   onPressed: showConfPass,
              //   obsecureText: showConfirm ? false : true,
              //   icon: showConfirm ? Icons.visibility_off : Icons.visibility,
              // ),
              const SizedBox(height: 10),
              // const MyTextField(hintText: "First Name"),
              // const SizedBox(height: 10),
              // const MyTextField(hintText: "Last Name"),

              const MyTextField(
                hintText: "Address",
                keyboardType: TextInputType.streetAddress,
              ),
              const SizedBox(height: 10),
              const MyTextField(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              // TextField(
              //   decoration: const InputDecoration(
              //     hintText: "Email",
              //     border: InputBorder.none,
              //   ),
              //   keyboardType: TextInputType.emailAddress,
              // ),
              const SizedBox(
                height: 12,
              ),

              const SizedBox(
                height: 20,
              ),
              MyButton(
                customColor: const Color.fromARGB(255, 185, 57, 10),
                text: "Sign Up",
                onTap: () {},
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
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
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Color.fromARGB(255, 238, 130, 6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
