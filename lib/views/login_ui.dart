// ignore_for_file: sort_child_properties_last

import 'package:festival_diary_app/models/userTB.dart';
import 'package:festival_diary_app/views/home_ui.dart';
import 'package:flutter/material.dart';
import 'package:festival_diary_app/constants/color_constant.dart';
import 'package:festival_diary_app/views/register_ui.dart';
import 'package:festival_diary_app/service/user_api.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  TextEditingController userNameCtrl = TextEditingController(text: '');
  TextEditingController passwordCtrl = TextEditingController(text: '');

  bool isShowUserPassword = true;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(mainColor),
        centerTitle: true,
        title: Text(
          "Festival Diary",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Image.asset(
                    "assets/images/festlogo.png",
                    width: 120,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextField(
                    controller: userNameCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextField(
                    controller: passwordCtrl,
                    obscureText: isShowUserPassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isShowUserPassword = !isShowUserPassword;
                              });
                            },
                            icon: isShowUserPassword == true
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility))),
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
                        if (userNameCtrl.text.trim().isEmpty) {
                          showwarningsnackbar(
                              context, 'Please enter your Username');
                        } else if (passwordCtrl.text.trim().isEmpty) {
                          showwarningsnackbar(
                              context, 'Please enter your password');
                        } else {
                          User user = User(
                            userName: userNameCtrl.text,
                            userPassword: passwordCtrl.text,
                          );
                          user = await UserAPI().checkLogin(user);
                          if (user.userId != null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeUI(user: user)));
                          } else {
                            showwarningsnackbar(
                                context, 'Incorrect Username or Password');
                          }
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Do not have an account??',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterUI()));
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    'Copyright © 2025',
                  ),
                  Text(
                    'Created by Thanakorn DTI-SAU',
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
