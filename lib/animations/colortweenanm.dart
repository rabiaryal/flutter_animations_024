import 'package:flutter/material.dart';

class TweenColorAnm extends StatefulWidget {
  const TweenColorAnm({super.key});

  @override
  State<TweenColorAnm> createState() => _TweenColorAnmState();
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    final rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);

    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    ));

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _TweenColorAnmState extends State<TweenColorAnm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
