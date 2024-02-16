import 'package:ainews/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:video_player/video_player.dart';

void main() {
  
  Gemini.init(apiKey: 'AIzaSyDztTJXIubhrH5LQ_Jejqys712iylUchwI');
  runApp(NewsVideoApp());}

class NewsVideoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Video Anchor',
      home: HomePage(),
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.white)),
      debugShowCheckedModeBanner: false,
    );
  }
}
