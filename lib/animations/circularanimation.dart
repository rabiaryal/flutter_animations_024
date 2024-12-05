import 'package:flutter/material.dart';
import 'dart:math' show pi;

class CircularAnimation extends StatefulWidget {
  const CircularAnimation({super.key});

  @override
  State<CircularAnimation> createState() => _CircularAnimationState();
}

enum CircleSide { left, right }

extension on VoidCallback {
  Future<void> delayed(Duration duration) => Future.delayed(duration, this);
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();
    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;

      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }

    path.arcToPoint(offset,
        radius: Radius.elliptical(size.width / 2, size.height / 2),
        clockwise: clockwise);
    path.close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;
  const HalfCircleClipper({
    required this.side,
  });

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class _CircularAnimationState extends State<CircularAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _counterClockwiseTotationController;
  late Animation<double> _counterClockwiseRotationAnimation;
  @override
  void initState() {
    super.initState();
    _counterClockwiseTotationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _counterClockwiseRotationAnimation = Tween<double>(
      begin: 0,
      end: -(pi / 2),
    ).animate(CurvedAnimation(
        parent: _counterClockwiseTotationController, curve: Curves.bounceIn));
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      _counterClockwiseTotationController
        ..reset()
        ..forward.delayed(const Duration(seconds: 1));
    });

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _counterClockwiseTotationController,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(_counterClockwiseRotationAnimation.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipPath(
                    clipper: const HalfCircleClipper(side: CircleSide.left),
                    child: Container(
                      color: const Color(0xff0057b7),
                      width: 100,
                      height: 100,
                    ),
                  ),
                  ClipPath(
                    clipper: const HalfCircleClipper(side: CircleSide.right),
                    child: Container(
                      color: const Color(0xffffd700),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
