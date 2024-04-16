import 'package:flutter/material.dart';
import 'dart:math';

class MovingContainers extends StatefulWidget {
  @override
  State<MovingContainers> createState() => _MovingContainersState();
}

class _MovingContainersState extends State<MovingContainers>
    with SingleTickerProviderStateMixin {
  final List<String> list = [
    "Chat",
    "Email",
    "Video Call",
    "News",
    "Voice Call",
    "Cartoon",
    "Game",
    "Language Practice",
  ];

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10), // Adjust duration as needed
    )..repeat(); // Repeat the animation indefinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double getRandomPosition(BuildContext context) {
    Random random = Random();
    return random.nextDouble() * MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.maxFinite,
      padding: EdgeInsets.all(20.0),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Color.fromARGB(50, 5, 134, 239),
                  Colors.transparent,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Stack(
              children: List.generate(
                list.length * 3, // Multiplying by 3 to ensure continuous wrapping
                (index) {
                  int rowIndex = index % 3; // Ensure 3 rows
                  double positionX = _controller.value *
                      (MediaQuery.of(context).size.width + 150.0) -
                      (index * 150.0);
                  return Positioned(
                    left: positionX,
                    top: rowIndex * 60.0,
                    // right: 0,
                    // bottom: 0,
                    child: ContainerWidget(text: list[index % list.length]),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class ContainerWidget extends StatefulWidget {
  final String text;

  const ContainerWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  _ContainerWidgetState createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.blue, // Color of the visible border
          width: 2, // Thickness of the border
        ),
      ),
      width: 120,
      height: 40,
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
