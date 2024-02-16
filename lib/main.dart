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
      debugShowCheckedModeBanner: false,
    );
  }
}

class NewsVideoAnchor extends StatefulWidget {
  @override
  _NewsVideoAnchorState createState() => _NewsVideoAnchorState();
}

class _NewsVideoAnchorState extends State<NewsVideoAnchor> {
  late VideoPlayerController _controller;
  final FlutterTts flutterTts = FlutterTts();
  String _newsContent =
      'Breaking news! Flutter developers create innovative applications.';

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
)..initialize().then((_) {
  _controller.play();
  _controller.setLooping(true);
});

    _speakNews();
  }

  Future<void> _speakNews() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(_newsContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              padding: EdgeInsets.all(20.0),
              child: Text(
                _newsContent,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    flutterTts.stop();
  }
}