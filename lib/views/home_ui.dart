// ignore_for_file: sort_child_properties_last

import 'package:festival_diary_app/constants/baseurl_constanst.dart';
import 'package:flutter/material.dart';
import 'package:festival_diary_app/constants/color_constant.dart';
import 'package:festival_diary_app/models/userTB.dart';

class HomeUI extends StatefulWidget {
  User? user;

  HomeUI({super.key, this.user});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            widget.user!.userImage! == ''
                ? Image.asset("assets/images/festlogo.png", height: 200)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                        '${baseUrl}/images/users/${widget.user!.userImage!}',
                        height: 200),
                  ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              widget.user!.userFullname!,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
