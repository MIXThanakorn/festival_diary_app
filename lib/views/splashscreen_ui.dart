import 'package:festival_diary_app/constants/color_constant.dart';
import 'package:festival_diary_app/views/login_ui.dart';
import 'package:flutter/material.dart';
import 'home_ui.dart';

class SplashscreenUI extends StatefulWidget {
  const SplashscreenUI({super.key});

  @override
  State<SplashscreenUI> createState() => _SplashscreenUIState();
}

class _SplashscreenUIState extends State<SplashscreenUI> {
  void initState() {
    Future.delayed(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginUI())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(mainColor),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/festlogo.png",
                width: 200,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              "Festival Diary",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
