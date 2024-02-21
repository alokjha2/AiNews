import 'package:ainews/import.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


class HowItWorks extends StatefulWidget {
  @override
  State<HowItWorks> createState() => _HowItWorksState();
}

class _HowItWorksState extends State<HowItWorks> {
  final list = {
    "Write Prompts": "Just write your prompt & get AI generated answers",
    "Video Call": "Just click on video call & get AI friend",
    "AI News": "No Bs anymore! No opinion! No biases! Consume AI generated News",
    "AI calls": "Have your own AI friend to talk to when you feel lonely in your native language",
    "AI assitant": "Have personal Assistant",
  };
  int _currentStep = 0;
  bool _isInProgress = false;

  List<StepData> steps = [
    StepData(label: 'Write Prompts', duration: Duration(seconds: 5)),
    StepData(label: 'Video Call', duration: Duration(seconds: 3)),
    StepData(label: 'AI News', duration: Duration(seconds: 7)),
    StepData(label: 'AI calls', duration: Duration(seconds: 4)),
    StepData(label: 'AI assitant', duration: Duration(seconds: 6)),
  ];

  //  int _currentStep = 0;

  void _startProgress(int index) {
    setState(() {
      _isInProgress = true;
    });
    Future.delayed(steps[index].duration, () {
      setState(() {
        _isInProgress = false;
        _currentStep = (index + 1) % steps.length;
      });
    });
  }

  void _increaseStep() {
    setState(() {
      _currentStep = (_currentStep + 1) % 100; // Assuming 100 total steps
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.maxFinite,
      child: Row(
        children: [
          Container(
            height: 400,
            width: 400,
            // color: Colors.grey[200],
            child: DeviceFrame(
              device: DeviceInfo.genericPhone(
                platform: TargetPlatform.fuchsia,
                id: "",
                name: "",
                screenSize: Size(300, 500),
              ),
              isFrameVisible: true,
              screen: Container(
                width: 160,
                height: 200,
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
          ),

                        StepProgressIndicator(
                          // progressDirection: TextDirection.,
                          onTap: (p0) => _increaseStep,
                          direction: Axis.vertical,
                  totalSteps: 100,
                  currentStep:  30,
                  size: 4,
                  padding: 0,
                  selectedColor: Colors.purple,
                  unselectedColor: Colors.grey,
                  roundedEdges: Radius.circular(10),
                  // roundedCap: (_, __) => true,
                  // selectedGradientColor: LinearGradient(
                  //     begin: Alignment.topLeft,
                  //     end: Alignment.bottomRight,
                  //     colors: [Colors.yellowAccent, Colors.deepOrange],
                  // ),
                  // unselectedGradientColor: LinearGradient(
                  //     begin: Alignment.topLeft,
                  //     end: Alignment.bottomRight,
                  //     colors: [Colors.black, Colors.blue],
                  // ),
              ),

          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                String title = list.keys.elementAt(index);
                String subtitle = list.values.elementAt(index);
                return TimelineItem(
                  title: title,
                  subtitle: subtitle,
                  isInProgress: _isInProgress && index == _currentStep,
                  onTap: () {
                    // _increaseStep();
                    if (!_isInProgress) {
                      _startProgress(index);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isInProgress;
  final VoidCallback onTap;

  TimelineItem({
    required this.title,
    required this.subtitle,
    required this.isInProgress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      trailing: Text(""),
      children: [
        ListTile(
          title: Text(subtitle),
          onTap: onTap,
        ),
      ],
    );
  }
}

class StepData {
  final String label;
  final Duration duration;

  StepData({
    required this.label,
    required this.duration,
  });
}
