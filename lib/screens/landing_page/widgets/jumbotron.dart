import 'dart:math';

import 'package:ainews/import.dart';
import 'package:ainews/shootingStar.dart';
import 'package:ainews/stars.dart' as a;
import 'package:flutter/material.dart';

class Jumbotron extends StatefulWidget {
  const Jumbotron({
    Key? key,
  }) : super(key: key);

  @override
  State<Jumbotron> createState() => _JumbotronState();
}

class _JumbotronState extends State<Jumbotron> with TickerProviderStateMixin {
    late AnimationController animationController;


  var random = Random();

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          if (!mounted) return;
          animationController.reverse();
        }
      });
    super.initState();
  }

  void setAnimation() {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
        Timer.periodic(Duration(seconds: 1), (Timer t) => setAnimation());
    Size size = MediaQuery.of(context).size;

    return 
    Stack(
        children: <Widget>[

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFF020012),
          ),
          ...makeStar(MediaQuery
              .of(context)
              .size
              .width, MediaQuery
              .of(context)
              .size
              .height),

              // Positioned(
                
              //   child: Center(
              //     child: AnimatedTextKit( 
              //             animatedTexts: [ 
              //             TyperAnimatedText('AI tools to ease your tasks', 
              //               textStyle: const TextStyle( 
              //                 color: Colors.white, 
              //                 fontSize: 30, 
              //                 backgroundColor: Colors.transparent)),
              //             ]
                //     ),
                // ),
// )
        ],
      );

  }
  
 List<Widget> makeStar(double width, double height) {
  double starsInRow = width / 50;
  double starsInColumn = height / 50;
  double starsNum = starsInRow != 0
      ? starsInRow * (starsInColumn != 0 ? starsInColumn : starsInRow)
      : starsInColumn;

  List<Widget> stars = [];

  // Add regular stars
  for (int i = 0; i < starsNum; i++) {
    stars.add(a.Star(
      top: random.nextInt(height.floor()).toDouble(),
      right: random.nextInt(width.floor()).toDouble(),
      animationController: animationController,
    ));
  }

  // Add shooting stars
  for (int i = 0; i < 3; i++) {
    stars.add(ShootingStar(
      startPosition: Offset(0, random.nextInt(height.floor()).toDouble()),
      endPosition: Offset(width, random.nextInt(height.floor()).toDouble()),
      animationController: animationController,
    ));
  }

  return stars;
}


}