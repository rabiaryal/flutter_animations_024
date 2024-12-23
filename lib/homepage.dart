import 'package:flutter/material.dart';
import 'package:flutter_animations_024/animations/3danimations.dart';
import 'package:flutter_animations_024/animations/circularanimation.dart';
import 'package:flutter_animations_024/animations/colortweenanm.dart';
import 'package:flutter_animations_024/animations/drawerwidget.dart';
import 'package:flutter_animations_024/animations/implictanimaton.dart';
import 'package:flutter_animations_024/animations/rotatingrectanimation.dart';
import 'package:flutter_animations_024/animations/shpaeanm.dart';
import 'package:flutter_animations_024/otheranimation/heroanimation.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  Widget _intoNextPage(Widget pageName, String pageTitle) {
    return RoundButton(
      buttonName: pageTitle,
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => pageName));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _intoNextPage(RotatingRectAnimatiosn(), "Rectangular Animation"),
            const SizedBox(
              height: 20,
            ),
            _intoNextPage(CircularAnimation(), "Flip Circular Animations"),
            const SizedBox(
              height: 15,
            ),
            _intoNextPage(ThreeDAnimations(), "3D- Animations"),
            const SizedBox(
              height: 15,
            ),
            _intoNextPage(HeroAnimation(), "Hero Animation"),
            const SizedBox(
              height: 15,
            ),
            _intoNextPage(ImplictAnimation(), "Zoom IN and OUT"),
            const SizedBox(
              height: 15,
            ),
            _intoNextPage(TweenColorAnm(), "Chnage Colors"),
            const SizedBox(
              height: 15,
            ),
            _intoNextPage(DrawerHomePage(), "Show Drawer"),
            const SizedBox(
              height: 15,
            ),
            _intoNextPage(ShapeAnimations(), "Shape Animation"),
          ],
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  RoundButton({super.key, required this.onPressed, required this.buttonName});

  final VoidCallback onPressed;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: const Color(0xff344691),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
