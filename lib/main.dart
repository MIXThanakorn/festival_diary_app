import 'package:festival_diary_app/views/splashscreen_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(FestivalDiaryApp());
}

class FestivalDiaryApp extends StatefulWidget {
  const FestivalDiaryApp({super.key});

  @override
  State<FestivalDiaryApp> createState() => _FestivalDiaryAppState();
}

class _FestivalDiaryAppState extends State<FestivalDiaryApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.robotoCondensedTextTheme(
              Theme.of(context).textTheme)),
      home: SplashscreenUI(),
    );
  }
}
