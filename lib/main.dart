import 'package:ainews/import.dart';

void main()async {
  setUrlStrategy(PathUrlStrategy());
  OpenAI.apiKey = "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";
  Gemini.init(apiKey: "AIzaSyDztTJXIubhrH5LQ_Jejqys712iylUchwI");
  runApp(NewsVideoApp());}

class NewsVideoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: ScrollBehavior(),
      title: 'Ai',
      home: 
      HomeScreen(),
      routes: {
        '/product': (context) => Products(),
        '/usecases': (context) => HowItWorks(),
        '/features': (context) => Features(),
        '/creators': (context) => Creators(),
        '/HomePage': (context) => HomePage(),
        // '/HomePage': (context) => (),
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
