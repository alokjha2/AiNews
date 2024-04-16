import 'dart:math';

import 'package:flutter/material.dart';

class ShootingStarPainter extends CustomPainter {
  ShootingStarPainter({
    required this.startOffset,
    required this.endOffset,
    required this.paint1,
    required this.length,
  });

  final Offset startOffset;
  final Offset endOffset;
  final Paint paint1;
  final double length;

  @override
  void paint(Canvas canvas, Size size) {
    final double dx = endOffset.dx - startOffset.dx;
    final double dy = endOffset.dy - startOffset.dy;
    final double distance = sqrt(dx * dx + dy * dy);

    final double normalizedDx = dx / distance;
    final double normalizedDy = dy / distance;

    final double currentX = startOffset.dx + normalizedDx * length;
    final double currentY = startOffset.dy + normalizedDy * length;

    final Path path = Path()
      ..moveTo(startOffset.dx, startOffset.dy)
      ..lineTo(currentX, currentY);

    // Calculate the angle for the cone shape
    final double angle = atan2(dy, dx);
    final double tailLength = length * 2; // Adjust the length of the tail as needed

    // Calculate the coordinates for the tail of the shooting star
    final double tailX = currentX - tailLength * cos(angle);
    final double tailY = currentY - tailLength * sin(angle);

    // Add lines to form the cone shape for the shooting star
    path.lineTo(tailX + 10 * sin(angle), tailY - 10 * cos(angle));
    path.lineTo(currentX, currentY);
    path.lineTo(tailX - 10 * sin(angle), tailY + 10 * cos(angle));
    path.close();

    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(ShootingStarPainter oldDelegate) {
    return oldDelegate.startOffset != startOffset ||
        oldDelegate.endOffset != endOffset ||
        oldDelegate.paint1 != paint1 ||
        oldDelegate.length != length;
  }
}

class Shooting extends StatefulWidget {
  final Offset startPosition;
  final Offset endPosition;
  final AnimationController animationController;
  final Duration duration;

  const Shooting({
    Key? key,
    required this.startPosition,
    required this.endPosition,
    required this.animationController,
    this.duration = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  _ShootingState createState() => _ShootingState();
}

class _ShootingState extends State<Shooting> {
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
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
        final currentLength = _animation.value * 100; // Adjust the value as needed
        return CustomPaint(
          painter: ShootingStarPainter(
            startOffset: widget.startPosition,
            endOffset: widget.endPosition,
            paint1: Paint()..color = Colors.red,
            length: currentLength,
          ),
        );
      },
    );
  }
}
