import 'package:ainews/import.dart';


class HowItWorks extends StatefulWidget {

  @override
  State<HowItWorks> createState() => _HowItWorksState();
}

class _HowItWorksState extends State<HowItWorks> {
  final _howworks = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // color: Colors.grey,
      child: Row(
        
        children: [
        DeviceFrame(
              device: DeviceInfo.genericPhone(platform: TargetPlatform.fuchsia, id: "", name: "", screenSize: Size(300, 500)),
              isFrameVisible: true,
              screen: Container(
                width: 200,
                height: 400,
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your App',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 20),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Welcome to your app!',
                            textStyle: TextStyle(fontSize: 18),
                            speed: Duration(milliseconds: 100),
                          ),
                        ],
                        repeatForever: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ],),
    );
    // Your home section widget implementation
  }
}