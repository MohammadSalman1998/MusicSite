// ignore_for_file: depend_on_referenced_packages
// import 'dart:convert';
// import 'dart:html';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:music_site/components/my_button.dart';
import 'package:music_site/components/my_text_field.dart';
// import 'package:csc_picker/csc_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/src/material/dropdown.dart';

class AddArtist extends StatefulWidget {
  const AddArtist({super.key});

  @override
  State<AddArtist> createState() => _AddArtistState();
}

class _AddArtistState extends State<AddArtist> {
  List<String> items = ['Male', 'Female'];
  String selectedItem = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Add Artist",
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
                width: 300,
              ),
              const SizedBox(
                height: 20,
              ),
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

              const SizedBox(
                height: 12,
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  // color:
                  // const Color.fromARGB(255, 203, 202, 202).withOpacity(0.5),
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
                      // child: DropdownMenu(
                      //   // controller: iconController,
                      //   width: double.maxFinite,
                      //   enableFilter: true,
                      //   requestFocusOnTap: true,
                      //   label: Text('Select Gender'),
                      //   inputDecorationTheme: InputDecorationTheme(
                      //     filled: true,
                      //     contentPadding: EdgeInsets.symmetric(vertical: 3.0),
                      //   ),
                      //   dropdownMenuEntries: [],
                      // ),

                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedItem,
                          items: items
                              .map((item) => DropdownMenuItem(
                                  value: item, child: Text(item)))
                              .toList(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          // dropdownColor: const Color.fromARGB(255, 154, 72, 72),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedItem = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  // color:
                  //     const Color.fromARGB(255, 154, 72, 72).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 237, 235, 235)
                          .withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: CSCPicker(
                  dropdownDecoration: const BoxDecoration(
                    color: Colors.transparent,
                    // borderRadius: BorderRadius.circular(5),
                  ),
                  selectedItemStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  // layout: Layout.vertical,
                  // showCities: false,
                  // showStates: false,
                  //flagState: CountryFlag.DISABLE,
                  onCountryChanged: (country) {},
                  onStateChanged: (state) {},
                  onCityChanged: (city) {},
                  dropdownDialogRadius: 30,
                  searchBarRadius: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                customColor: const Color.fromARGB(255, 185, 57, 10),
                text: "Add",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
