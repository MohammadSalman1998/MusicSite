// import 'package:csc_picker/csc_picker.dart';
// import 'package:csc_picker/dropdown_with_search.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:music_site/components/my_button.dart';
import 'package:music_site/components/my_text_field.dart';

class AddSong extends StatefulWidget {
  const AddSong({super.key});

  @override
  State<AddSong> createState() => _AddSongState();
}

class _AddSongState extends State<AddSong> {
  List<String> items = ['Male', 'Female'];
  String selectedItem = 'Male';
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
              const MyTextField(hintText: "Title"),
              const SizedBox(height: 10),
              const MyTextField(hintText: "Type"),
              const SizedBox(height: 10),
              const MyTextField(
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DropdownMenu(
                        // controller: iconController,
                        width: double.maxFinite,
                        enableFilter: true,
                        requestFocusOnTap: true,
                        label: Text('Select an Artist'),
                        inputDecorationTheme: InputDecorationTheme(
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 3.0),
                        ),
                        dropdownMenuEntries: [],
                      ),
                    ),
                  ],
                ),
              ),

              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Expanded(
              //       child: DropdownMenu(
              //         // controller: iconController,
              //         enableFilter: true,
              //         requestFocusOnTap: true,
              //         // leadingIcon: Icon(Icons.s),
              //         label: Text('Select an Artist'),
              //         inputDecorationTheme: InputDecorationTheme(
              //           filled: true,
              //           contentPadding: EdgeInsets.symmetric(vertical: 5.0),
              //         ),
              //         dropdownMenuEntries: [],
              //         // onSelected: () {},
              //         // dropdownMenuEntries:
              //         //   IconLabel.values.map<DropdownMenuEntry>(
              //         // (IconLabel icon) {
              //         // return DropdownMenuEntry(
              //         // value: icon,
              //         // label: icon.label,
              //         //   leadingIcon: Icon(icon.icon),
              //         // );
              //         // },
              //         // ).toList(),
              //       ),
              //     ),
              //   ],
              // ),

              const SizedBox(
                height: 12,
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
