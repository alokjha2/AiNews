import 'package:ainews/home_scene.dart';
import 'package:ainews/import.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_admob/firebase_admob.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  DatabaseHelper.initDatabase();
  runApp(NewsVideoApp());}

class NewsVideoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    // return GetMaterialApp(
      
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch, PointerDeviceKind.stylus, 
          PointerDeviceKind.unknown
          },
      ),
      title: 'Ai',
      home: 

      const HomeScene(),
      routes: {
        '/HomePage': (context) => HomePage(),
        "/LandingPage" : (context) => LandingPage()
      },
      // darkTheme: ThemeData.dark(),
      // themeMode:
      // Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      //  ThemeMode.system,
      theme: ThemeData(
        backgroundColor: bgColor,
        // appBarTheme: AppBarTheme(color: Colors.white)
        ),
      debugShowCheckedModeBanner: false,
    );
  }
}

