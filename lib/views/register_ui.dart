// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:festival_diary_app/models/userTB.dart';
import 'package:festival_diary_app/service/user_api.dart';
import 'package:flutter/material.dart';
import 'package:festival_diary_app/constants/color_constant.dart';
import "package:image_picker/image_picker.dart";
import 'dart:io';

class RegisterUI extends StatefulWidget {
  const RegisterUI({super.key});

  @override
  State<RegisterUI> createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
  bool isVislable = true;
  TextEditingController userFullnameCtrl = TextEditingController(text: '');
  TextEditingController userNameCtrl = TextEditingController(text: '');
  TextEditingController passwordCtrl = TextEditingController(text: '');

  showwarningsnackbar(context, mes) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        mes,
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

  showcompletesnackbar(context, mes) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        mes,
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: const Color.fromARGB(255, 6, 107, 9),
    ));
  }

  File? userFile;
  Future<void> openCamera() async {
    final img = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 75,
    );
    if (img == null) return;

    setState(() {
      userFile = File(img.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(mainColor),
          centerTitle: true,
          title: Text(
            "Register",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              )),
        ),
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Center(
                        child: Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      InkWell(
                          onTap: () async {
                            await (openCamera());
                          },
                          child: userFile == null
                              ? Icon(
                                  Icons.person_add_alt_1,
                                  size: 100,
                                  color: Color(mainColor),
                                )
                              : Image.file(
                                  userFile!,
                                  width: 125,
                                  height: 125,
                                  fit: BoxFit.cover,
                                )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'UserFullname',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      TextField(
                        controller: userFullnameCtrl,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.featured_play_list)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Username',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      TextField(
                        controller: userNameCtrl,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      TextField(
                        controller: passwordCtrl,
                        obscureText: isVislable,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVislable = !isVislable;
                                });
                              },
                              icon: Icon(isVislable == false
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.visibility_sharp),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Color(mainColor)),
                          onPressed: () async {
                            if (userFullnameCtrl.text.trim().isEmpty) {
                              showwarningsnackbar(
                                  context, 'Please enter your Fullname');
                            } else if (userNameCtrl.text.trim().isEmpty) {
                              showwarningsnackbar(
                                  context, 'Please enter your Username');
                            } else if (passwordCtrl.text.trim().isEmpty) {
                              showwarningsnackbar(
                                  context, 'Please enter your password');
                            } else {
                              User user = User(
                                userFullname: userFullnameCtrl.text.trim(),
                                userName: userNameCtrl.text.trim(),
                                userPassword: passwordCtrl.text.trim(),
                              );
                              if (await UserAPI()
                                  .registerUser(user, userFile)) {
                                showcompletesnackbar(
                                  context,
                                  'Registered successfully',
                                );
                              } else {
                                showwarningsnackbar(context, 'Cannot register');
                              }
                            }
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                    ]))))));
  }
}
