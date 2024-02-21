import 'package:flutter/material.dart';

class MovingContainers extends StatefulWidget {
  @override
  _MovingContainersState createState() => _MovingContainersState();
}

class _MovingContainersState extends State<MovingContainers> {
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
  ];

  double _offset = 0.0;
  double _speed = 0.5;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(Duration(milliseconds: 16), () {
      setState(() {
        _offset += _speed;
        if (_offset > 1.0) {
          _offset = 0.0;
        }
      });
      _startAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Stack(
        children: List.generate(
          3,
          (rowIndex) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                20,
                (index) {
                  int containerIndex = rowIndex * 7 + index;
                  return Positioned(
                    left: _offset *
                            (MediaQuery.of(context).size.width + 100) -
                        (index * 60),
                    top: rowIndex * 60.0,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: colors[containerIndex % colors.length],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
