

import 'package:ainews/import.dart';

class ShootingStar extends StatefulWidget {
  final Offset startPosition;
  final Offset endPosition;
  final AnimationController animationController;
  final Duration duration;

  const ShootingStar({
    Key? key,
    required this.startPosition,
    required this.endPosition,
    required this.animationController,
    this.duration = const Duration(seconds: 2), // Default duration is 2 seconds
  }) : super(key: key);

  @override
  _ShootingStarState createState() => _ShootingStarState();
}

class _ShootingStarState extends State<ShootingStar> {
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animation = Tween<Offset>(
      begin: widget.startPosition,
      end: widget.endPosition,
    ).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        // Check if the star has passed the endPosition
        if (_animation.value.dy > widget.endPosition.dy ||
            _animation.value.dx > widget.endPosition.dx) {
          // Stop animating the star by returning an empty container
          return Container();
        }
        // Render the meteor streak at its current position
        return Positioned(
          top: _animation.value.dy,
          left: _animation.value.dx,
          child: MeteorStreak(), // Custom widget representing the meteor streak
        );
      },
    );
  }
}


class MeteorStreak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(10, 10), // Adjust the size as needed
      painter: MeteorPainter(),
    );
  }
}

class MeteorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [Color.fromARGB(255, 239, 33, 14), Colors.purple],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final double tailLength = size.height * 0.8; // Adjust the tail length as needed

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(0, size.height)
      ..lineTo(-tailLength, size.height / 2) // Extend the tail backwards
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

   