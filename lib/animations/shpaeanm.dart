import 'package:flutter/material.dart';
import 'dart:math' show pi, cos, sin;

class ShapeAnimations extends StatefulWidget {
  const ShapeAnimations({super.key});

  @override
  State<ShapeAnimations> createState() => _ShapeAnimationsState();
}

class Polygon extends CustomPainter {
  final int sides;

  Polygon({required this.sides});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    final path = Path();

    final center = Offset(size.width / 2, size.height / 2);
    final angle = 2 * pi / sides;
    final radius = size.width / 2;

    // Move to the first vertex
    path.moveTo(
      center.dx + radius * cos(0),
      center.dy + radius * sin(0),
    );

    // Draw lines to each vertex
    for (int i = 1; i <= sides; i++) {
      final x = center.dx + radius * cos(i * angle);
      final y = center.dy + radius * sin(i * angle);
      path.lineTo(x, y);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is Polygon && oldDelegate.sides != sides;
  }
}

class _ShapeAnimationsState extends State<ShapeAnimations>
    with TickerProviderStateMixin {
  late AnimationController _sidesController;
  late Animation<int> _sideAnimation;

  late AnimationController _radiousController;
  late Animation<double> _radiousAnimation;

  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;
  @override
  void initState() {
    super.initState();
    _sidesController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _sideAnimation = IntTween(
      begin: 3,
      end: 10,
    ).animate(_sidesController);
    _radiousController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _radiousAnimation = Tween(
      begin: 20.0,
      end: 400.0,
    ).chain(CurveTween(curve: Curves.bounceOut)).animate(_radiousController);

    _rotationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _rotationAnimation = Tween(
      begin: 0.0,
      end: 2 * pi,
    ).chain(CurveTween(curve: Curves.easeInOut)).animate(_rotationController);
  }

  @override
  void dispoase() {
    _sidesController.dispose();
    _radiousController.dispose();
    _radiousController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sidesController.repeat(reverse: true);
    _radiousController.repeat(reverse: true);
    _rotationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          100, 100, 100, 100), // Adjusted background color for visibility
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge(
              [_sidesController, _radiousController, _rotationController]),
          builder: (contextl, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
              ..rotateX(_rotationAnimation.value)
              ..rotateY(_rotationAnimation.value)
              ..rotateZ(_rotationAnimation.value),
              child: CustomPaint(
                painter: Polygon(sides: 10), // Change sides as needed
                child: SizedBox(
                  width: _radiousAnimation.value,
                  height: _radiousAnimation.value,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
