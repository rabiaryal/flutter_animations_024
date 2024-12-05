import 'package:flutter/material.dart';

class CircularAnimation extends StatefulWidget {
  const CircularAnimation({super.key});

  @override
  State<CircularAnimation> createState() => _CircularAnimationState();
}

enum CircleSide { left, right }

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

      // TODO: Handle this case.
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;

      // TODO: Handle this case.
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

class _CircularAnimationState extends State<CircularAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
        centerTitle: true,
      ),
      body: Row(
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
  }
}
