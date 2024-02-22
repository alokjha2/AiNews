import 'package:flutter/material.dart';


class MovingContainers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: List.generate(3, (rowIndex) {
          return Row(
            children: List.generate(20, (index) {
              int containerIndex = rowIndex * 20 + index;
              return Expanded(
                child: ContainerWidget(
                  key: ValueKey(containerIndex),
                  text: "Container $containerIndex", // Custom text
                ),
              );
            }),
          );
        }),
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
  late double _containerWidth;
  late double _containerHeight;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final context = this.context;
      final size = MediaQuery.of(context).size;
      _containerWidth = size.width / 20;
      _containerHeight = size.height / 3;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: 0, // Animate from right to left
      duration: const Duration(seconds: 10),
      curve: Curves.linear,
      child: Container(
        width: _containerWidth,
        height: _containerHeight,
        color: Colors.blue,
        margin: const EdgeInsets.all(4.0),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
