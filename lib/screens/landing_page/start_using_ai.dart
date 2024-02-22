


import 'package:flutter/material.dart';

class AnimatedContainers extends StatefulWidget {
  @override
  _AnimatedContainersState createState() => _AnimatedContainersState();
}

class _AnimatedContainersState extends State<AnimatedContainers>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final Map<String, String> data = {
    "Personalised News Anchor" : "Will get personalised News anchor",
    "Free unlimited chats" : "Ask as many questions you want to ask",
    "Voice Call" : "Voice call in native language ask as many questions you want to ask" 
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 200).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.forward();
  }

  void _stopAnimation() {
    _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    //  final title = data.keys.elementAt(index);
    //         final description = data[title];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _startAnimation();
          },
          onTapCancel: () {
            _stopAnimation();
          },
          onTapUp: (_) {
            _stopAnimation();
          },
          child: Container(
  height: size.height / 2 - 100,
  width: size.width,
  decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(
      color: Colors.black, // Border color
      width: 2.0, // Border width
    ),
    borderRadius: BorderRadius.circular(10.0), // Border radius
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  ),
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data.keys.first, // Display only the first entry key
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              data.values.first, // Display only the first entry value
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),

        Container(height: 50, width: 40,color: Colors.red,)
        // Add your animated widget here
        // For example, AnimatedContainer, AnimatedOpacity, etc.
      ],
    ),
  ),
),


        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                _startAnimation();
              },
              onTapCancel: () {
                _stopAnimation();
              },
              onTapUp: (_) {
                _stopAnimation();
              },
              child: Container(
                width: size.width/2- 80,
                height: size.height/2 - 30,
                color: Colors.red,
                child: Center(
                  child: Text(
                    'Square 1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                _startAnimation();
              },
              onTapCancel: () {
                _stopAnimation();
              },
              onTapUp: (_) {
                _stopAnimation();
              },
              child: Container(
                width: size.width/2 - 80,
                height: size.height/2 - 30,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Square 2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
